class ApplicationController < ActionController::Base
  before_action :create_guest_user_if_needed
  before_action :configure_permitted_parameters, if: :devise_controller?

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  def current_or_guest_user
    if current_user
      if session[:guest_user_id] && session[:guest_user_id] != current_user.id
        logging_in
        # reload guest_user to prevent caching problems before destruction
        guest_user(with_retry = false).try(:reload).try(:destroy)
        session[:guest_user_id] = nil
      end
      current_user
    else
      guest_user
    end
  end

  def guest_user(with_retry = true)
    # Cache the value the first time it's gotten.
    @cached_guest_user ||= User.find(session[:guest_user_id] ||= create_guest_user_if_needed.id)
  rescue ActiveRecord::RecordNotFound # if session[:guest_user_id] invalid
    session[:guest_user_id] = nil
    guest_user if with_retry
  end

  def create_guest_user_if_needed
    if session[:user_id]
      u = User.find(session[:user_id])
    else
      u = User.new(:first_name => "guest", :email => "guest_#{Time.now.to_i}#{rand(100)}@example.com")
      u.save!(:validate => false)
      session[:user_id] = u.id
    end
    u
  end

  def logging_in
    guest_orders = guest_user.orders.all
    guest_orders.each do |order|
      order.user_id = current_user.id
      order.save!
    end
    guest_order_items = OrderItem.where(user_id: guest_user.id)
    guest_order_items.each do |orderItem|
      orderItem.user_id = current_user.id
      orderItem.save!
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :street_name, :street_number, :postal_code, :city, :country, :optional])
  end
end

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :contact]

  def home
    @contact = Contact.all.first
    products_id_with_qtys = OrderItem.group(:product_id).sum(:quantity)
    products_qtys = OrderItem.group(:product_id).sum(:quantity).values.max(4)
    @products_ids = []
    products_qtys.each do |value|
      @products_ids << products_id_with_qtys.key(value)
    end
    @most_sold_products = []
    @products_ids.each do |id|
      if @most_sold_products.include? Product.find(id)
      else
        @most_sold_products << Product.find(id)
      end
    end
    if Product.where(pod: true).size >= 1
      @pod = Product.where(pod: true).first
    end
    if Recipe.where(display_recipe: true).size >= 1
      @recipe = Recipe.where(display_recipe: true).first
    end
  end

  def checkout
    @user = current_user
    @order = @user.orders.last
  end

  def delivery_zone
  end

  def contact
    @contact = Contact.all.first
  end

  def dashboard
    @orders = Order.all
    @products = Product.all
    @categories = Category.all
  end
end

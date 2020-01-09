class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    products_id_with_qtys = OrderItem.group(:product_id).sum(:quantity)
    products_qtys = OrderItem.group(:product_id).sum(:quantity).values.max(3)
    @products_ids = []
    products_qtys.each do |value|
      @products_ids << products_id_with_qtys.key(value)
    end
    @most_sold_products = []
    @products_ids.each do |id|
      @most_sold_products << Product.find(id)
    end
  end

  def checkout
    @user = current_user
    @order = @user.orders.last
  end

  def delivery_zone
  end
end

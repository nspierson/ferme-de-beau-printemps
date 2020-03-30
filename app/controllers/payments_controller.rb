class PaymentsController < ApplicationController
  def new
    @order = current_user.orders.where(state: 'pending').find(params[:order_id])
    @cart_total = current_user.cart_total_price
    @delivery_fee = OrderItem.find(@order.order_item_ids).map { |prod| prod.delivery_fee }.max
  end

  # def get_delivery_fee(order)
  #   delivery_fees = OrderItem.find(order.order_item_ids).map
  #   delivery_fee = delivery_fees.max
  #   return delivery_fee
  # end

end

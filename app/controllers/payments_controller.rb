class PaymentsController < ApplicationController
  def new
    @order = current_or_guest_user.orders.where(state: 'pending').find(params[:order_id])
    @cart_total = current_or_guest_user.cart_total_price
    if current_or_guest_user.order_total_weight >= 10000 || current_or_guest_user.order_total_weight == 0
      @delivery_fee = 0
    else
      @delivery_fee = 2.10
    end
  end
end

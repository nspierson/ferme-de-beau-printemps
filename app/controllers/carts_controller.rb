class CartsController < ApplicationController
  def show
    @cart_products_with_qty = current_or_guest_user.get_cart_products_with_qty
    @cart_total = current_or_guest_user.cart_total_price
    @cart_total_with_fee = current_or_guest_user.cart_total_price.to_i + current_or_guest_user.get_delivery_fees.to_i
    @delivery_fee = current_or_guest_user.get_delivery_fees
  end

  def addone
    current_or_guest_user.add_one_to_cart(params[:product_id])
    redirect_to cart_path
  end

  def add
    current_or_guest_user.add_to_cart(params[:product_id], params[:format])
  end


  def remove
    current_or_guest_user.remove_from_cart(params[:product_id])
    redirect_to cart_path
  end

  def removeone
    current_or_guest_user.remove_one_from_cart(params[:product_id])
    redirect_to cart_path
  end
end

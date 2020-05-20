class CartsController < ApplicationController
  def show
    @cart_products_with_qty = current_or_guest_user.get_cart_products_with_qty
    @cart_total = current_or_guest_user.cart_total_price
    if current_or_guest_user.get_cart_total_weight >= 10000 || current_or_guest_user.get_cart_total_weight == 0
      @delivery_fee = 0
    else
      @delivery_fee = 2.10
    end
    @cart_total_with_fee = current_or_guest_user.cart_total_price.to_i + @delivery_fee
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

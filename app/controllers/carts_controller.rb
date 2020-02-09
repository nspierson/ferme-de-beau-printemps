class CartsController < ApplicationController
  def show
    @cart_products_with_qty = current_user.get_cart_products_with_qty
    @cart_total = current_user.cart_total_price
  end

  def addone
    current_user.add_one_to_cart(params[:product_id])
    redirect_to cart_path
  end

  def add
    current_user.add_to_cart(params[:product_id], params[:format])
  end

  def remove
    current_user.remove_from_cart(params[:product_id])
    redirect_to cart_path
  end

  def removeone
    current_user.remove_one_from_cart(params[:product_id])
    redirect_to cart_path
  end
end

class OrdersController < ApplicationController
  before_action :authenticate_user!
  def create
    @user = current_user
    cart = @user.current_user_cart
    total_price = @user.cart_total_price
    total_price_in_e = (total_price.to_i * 100)
    @cart_products_with_qty = @user.get_cart_products_with_qty
    order = Order.create!(user_id: @user.id, amount_cents: total_price.to_i, state: 'pending')
    @cart_products_with_qty.each do |array|
      product = array[0]
      qty = array[1]
      order_items = OrderItem.new(user_id: @user.id, order_id: order.id, product_id: product.id, quantity: qty.to_i, price_for_one: product.price_cents, total_price: (product.price_cents * qty.to_i), name: product.name)
      order_items.save
    end
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: 'Panier',
        description: 'Panier du client',
        amount: total_price_in_e,
        currency: 'eur',
        quantity: 1,
      }],
      success_url: "http://localhost:3000/checkout/#{order.id}",
      cancel_url: 'http://localhost:3000/products',
    )
    order.update(checkout_session_id: session.id)
    REDIS.del cart
    redirect_to new_order_payment_path(order)
  end

  def index
    @orders = Order.where(user_id: current_user.id)
  end

  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: @order.id)
  end
end

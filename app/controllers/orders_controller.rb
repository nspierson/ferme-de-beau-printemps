class OrdersController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:new, :create]
  def create
    @user = current_or_guest_user
    cart = @user.current_user_cart
    total_price = @user.cart_total_price
    delivery_fee = (@user.get_delivery_fees.to_i * 100)
    total_price_in_e = (total_price.to_i * 100)
    @cart_products_with_qty = @user.get_cart_products_with_qty
    @cart_products = @user.get_cart_products
    order = Order.create!(user_id: @user.id, amount_cents: total_price.to_i, state: 'pending')
    @cart_products_with_qty.each do |array|
      product = array[0]
      qty = array[1]
      order_items = OrderItem.new(user_id: @user.id, order_id: order.id, product_id: product.id, quantity: qty.to_i, price_for_one: product.price, total_price: (product.price * qty.to_i), name: product.name, delivery_fee: product.delivery_fee)
      order_items.save
    end
    session = Stripe::Checkout::Session.create(
      billing_address_collection: 'auto',
      shipping_address_collection: {
        allowed_countries: ['FR'],
      },
      payment_method_types: ['card'],
      line_items: [{
        name: 'Votre Panier',
        description: 'Ferme de Beau Printemps',
        amount: total_price_in_e + delivery_fee,
        currency: 'eur',
        quantity: 1,
      }],
      success_url: order_url(order),
      cancel_url: 'http://localhost:3000/products'
    )
    order.update(checkout_session_id: session.id)
    REDIS.del cart
    redirect_to new_order_payment_path(order)
  end

  def index
    @products = Product.all
    @orders = Order.where(user_id: current_or_guest_user.id)
    @all_orders = Order.all
    @recipes = Recipe.all
  end

  def show
    @order = Order.find(params[:id])
    @delivery_fee = OrderItem.find(@order.order_item_ids).map { |prod| prod.delivery_fee }.max
    @user = User.find(@order.user_id)
    @order_items = OrderItem.where(order_id: @order.id)
    @items = []
    @order_items.each do |item|
      @items << Product.find(item.product_id)
    end
  end

  def display_recip
    @displayed_recipe = Recipe.where(display_recipe: true)
    if @displayed_recipe.size >= 1
      @displayed_recipe = Recipe.where(display_recipe: true).first
      @displayed_recipe.display_recipe = false
      @displayed_recipe.save
    end
    @recipe = Recipe.find(params[:recipe_id])
    @recipe.display_recipe = true
    @recipe.save
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
    # redirect_to product_path(@product)
  end

  def mark_as_delivered
    @order = Order.find(params[:order_id])
    @order.delivered = true
    @order.save
    user = User.find(@order.user_id)
    UserMailer.order_delivery(user).deliver_now
    redirect_to orders_path
  end
end

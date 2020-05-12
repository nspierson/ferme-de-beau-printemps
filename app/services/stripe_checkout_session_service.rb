class StripeCheckoutSessionService
  def call(event)
    order = Order.find_by(checkout_session_id: event.data.object.id)

    order.update(state: 'paid', shipping_address: event['data']['object']['shipping']['address']['city'])
    UserMailer.order_success(event['data']['object']['shipping']['name'], Stripe::Customer.retrieve(event['data']['object']['customer']).email).deliver_now
  end
end


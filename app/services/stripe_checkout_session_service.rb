class StripeCheckoutSessionService
  def call(event)
    order = Order.find_by(checkout_session_id: event.data.object.id)
    order.update(state: 'paid', shipping_address: event['data']['object']['shipping']['address']['city'])
    UserMailer.order_success(User.find(order.user_id)).deliver_now
  end
end

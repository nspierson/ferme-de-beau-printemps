class StripeCheckoutSessionService
  def call(event)
    order = Order.find_by(checkout_session_id: event.data.object.id)

    order.update(state: 'paid', city: event['data']['object']['shipping']['address']['city'], country: event['data']['object']['shipping']['address']['country'], street: event['data']['object']['shipping']['address']['line1'], street2: event['data']['object']['shipping']['address']['line2'], postal_code: event['data']['object']['shipping']['address']['postal_code'], client_name: event['data']['object']['shipping']['name'], client_email: Stripe::Customer.retrieve(event['data']['object']['customer']).email)
    UserMailer.order_success(event['data']['object']['shipping']['name'], Stripe::Customer.retrieve(event['data']['object']['customer']).email).deliver_now
  end
end


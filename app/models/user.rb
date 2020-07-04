class User < ApplicationRecord
  # after_create :send_welcome_email
  has_many :orders, dependent: :nullify
  has_many :order_items, dependent: :nullify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true, format: { with: /\A.*@.*\.com\z/ }
  validates :street_name, presence: true
  validates :street_number, presence: true
  validates :postal_code, presence: true
  validates :city, presence: true

  def current_user_cart
    "cart#{id}"
  end

  def add_one_to_cart(product_id)
    REDIS.hincrby current_user_cart, product_id, 1
  end

  def add_to_cart(product_id, qty)
    REDIS.hincrby current_user_cart, product_id, qty
  end

  def remove_from_cart(product_id)
    REDIS.hdel current_user_cart, product_id, 1
  end

  def remove_one_from_cart(product_id)
    REDIS.hincrby current_user_cart, product_id, -1
  end

  def cart_count
    quantities = REDIS.hvals "cart#{id}"
    quantities.reduce(0) { |sum, qty| sum + qty.to_i }
  end

  def get_delivery_fees
    delivery_fees = get_cart_products.map { |product| product.delivery_fee }
    delivery_fee = delivery_fees.max
    return delivery_fee
  end

  def get_cart_total_weight
    get_cart_products_with_qty.map { |product, qty| product.weight * qty.to_i }.reduce(:+)
  end

  def order_total_weight
    all_weights = []
    all_products = []
    order = self.orders.last
    order_items = order.order_items
    order_items.each do |item|
      all_weights << (Product.find(item.product_id).weight * item.quantity)
    end
    total_weight = all_weights.map(&:to_i).reduce(0, :+)
    return total_weight
  end

  def cart_total_price
    get_cart_products_with_qty.map { |product, qty| product.price * qty.to_i }.reduce(:+)
  end

  def get_cart_products_with_qty
    cart_ids = []
    cart_qtys = []
    (REDIS.hgetall current_user_cart).map do |key, value|
      cart_ids << key
      cart_qtys << value
    end
    cart_products = Product.find(cart_ids)
    cart_products.zip(cart_qtys)
  end

  def get_cart_products
    cart_ids = []
    (REDIS.hgetall current_user_cart).map do |key, value|
      cart_ids << key
    end
    cart_products = Product.find(cart_ids)
    return cart_products
  end

  def purchase_cart_products
    get_cart_products_with_qty.each do |product, qty|
      Order.create(user: self, product: product, quantity: qty)
    end
    REDIS.del current_user_cart
  end

  private

  def send_welcome_email
    if self.email != "guest@example.com"
      UserMailer.welcome(self).deliver_now
    else
    end
  end
end

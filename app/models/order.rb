class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  monetize :amount_cents

  def create
    @cart_products_with_qty = current_user.get_cart_products_with_qty
    @cart_total = current_user.cart_total_price
  end
end

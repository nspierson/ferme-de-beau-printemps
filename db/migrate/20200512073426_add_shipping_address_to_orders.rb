class AddShippingAddressToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :shipping_address, :string
  end
end

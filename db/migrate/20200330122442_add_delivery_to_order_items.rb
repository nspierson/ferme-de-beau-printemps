class AddDeliveryToOrderItems < ActiveRecord::Migration[5.2]
  def change
    add_column :order_items, :delivery_fee, :integer
  end
end

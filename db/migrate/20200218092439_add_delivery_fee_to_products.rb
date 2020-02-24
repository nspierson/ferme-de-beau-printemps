class AddDeliveryFeeToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :delivery_fee, :float
  end
end

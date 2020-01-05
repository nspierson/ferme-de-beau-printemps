class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.references :user, foreign_key: true
      t.references :order, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :quantity
      t.integer :price_for_one
      t.integer :total_price
      t.string :name

      t.timestamps
    end
  end
end

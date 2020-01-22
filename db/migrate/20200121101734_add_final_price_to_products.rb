class AddFinalPriceToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :final_price, :integer
  end
end

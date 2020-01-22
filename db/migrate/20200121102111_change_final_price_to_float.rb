class ChangeFinalPriceToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :final_price, :float
  end
end

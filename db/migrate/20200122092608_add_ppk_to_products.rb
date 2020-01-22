class AddPpkToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :ppk, :float
  end
end

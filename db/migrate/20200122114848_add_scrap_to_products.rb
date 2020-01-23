class AddScrapToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :scrap, :string
  end
end

class ShowImgUrlToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :show_image_url, :string
  end
end

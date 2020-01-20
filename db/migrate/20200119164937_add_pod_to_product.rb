class AddPodToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :pod, :boolean
  end
end

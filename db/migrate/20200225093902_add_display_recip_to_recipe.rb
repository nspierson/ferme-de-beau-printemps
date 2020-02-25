class AddDisplayRecipToRecipe < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :display_recipe, :boolean
  end
end

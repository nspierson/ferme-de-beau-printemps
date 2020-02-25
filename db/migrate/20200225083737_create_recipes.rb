class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :ingredients
      t.integer :capacity
      t.integer :time
      t.integer :difficulty
      t.integer :prep_time
      t.integer :cook_time
      t.timestamps
    end
  end
end

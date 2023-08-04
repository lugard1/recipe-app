class DropTableRecipeFood < ActiveRecord::Migration[7.0]
  def change
    drop_table :recipe_foods
  end
end

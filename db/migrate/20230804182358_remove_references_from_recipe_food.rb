class RemoveReferencesFromRecipeFood < ActiveRecord::Migration[7.0]
  def change
    remove_reference :recipe_foods, :recipee, foreign_key: true
    remove_reference :recipe_foods, :food, foreign_key: true
  end
end

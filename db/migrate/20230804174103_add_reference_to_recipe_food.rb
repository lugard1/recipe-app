class AddReferenceToRecipeFood < ActiveRecord::Migration[7.0]
  def change
    add_reference :recipe_foods, :recipee, foreign_key: true
  end
end

class RecipeFood < ApplicationRecord
  belongs_to :recipee
  belongs_to :food
end

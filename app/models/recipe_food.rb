class RecipeFood < ApplicationRecord
  validates :quantity, :recipe_id, presence: true, numericality: { greater_than_or_equal_to: 1 }

  belongs_to :food
  belongs_to :recipe, counter_cache: true
end

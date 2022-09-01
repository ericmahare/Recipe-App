class Ingredient < ApplicationRecord
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 1 }

  belongs_to :food
  belongs_to :recipe
end

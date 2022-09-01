class Recipe < ApplicationRecord
  validates :name, presence: true

  belongs_to :user, counter_cache: true
  has_many :ingredients, dependent: :destroy
  has_many :foods, through: :ingredients, dependent: false

  def public_recipes
    Recipe.where(public: true).order(created_at: :DESC)
  end
end

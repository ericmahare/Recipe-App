class Recipe < ApplicationRecord
  validates :name, :description, :cooking_time, :prep_time, presence: true
  after_initialize :init

  belongs_to :user, counter_cache: true
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods

  def init
    self.recipe_foods_count ||= 0
  end
end

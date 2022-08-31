class Recipe < ApplicationRecord
  validates :name, presence: true

  belongs_to :user, counter_cache: true
  # has_many :food, independent: :destroy
end

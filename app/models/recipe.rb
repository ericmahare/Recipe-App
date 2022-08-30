class Recipe < ApplicationRecord
  belongs_to :user, counter_cache: true
  has_many :food, independent: :destroy
end

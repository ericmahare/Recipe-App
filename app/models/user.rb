class User < ApplicationRecord
  after_initialize :init
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :recipes_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :recipes, counter_cache: true

  # private

  def init
    self.recipes_count ||= 0.to_s
    true
  end
end

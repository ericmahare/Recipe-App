class User < ApplicationRecord
  after_initialize :init
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recipes, counter_cache: true

  # private

  def init
    self.recipes_count ||= 0.to_s
    true
  end
end

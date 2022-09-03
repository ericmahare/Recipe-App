require 'rails_helper'

RSpec.describe Food, type: :model do
  before :each do
    @user = User.create(name: 'Chia', email: 'chia@dev.me', password: 'password', password_confirmation: 'password')
  end
  context 'validations' do
    it 'is valid with valid attributes' do
      food = Food.create(name: 'Pasta', measurement_unit: 'Litter', price: 10, user_id: @user.id)
      expect(food).to be_valid
    end
    it 'is not valid without a name' do
      food = Food.create(name: nil, measurement_unit: 'Litter', price: 10, user_id: @user.id)
      expect(food).to_not be_valid
    end
    it 'is not valid without mesurement_unit' do
      food = Food.create(name: 'Pasta', measurement_unit: nil, price: 10, user_id: @user.id)
      expect(food).to_not be_valid
    end
    it 'is not valid without price' do
      food = Food.create(name: 'Pasta', measurement_unit: 'Litter', price: nil, user_id: @user.id)
      expect(food).to_not be_valid
    end
    it 'is not valid without user id' do
      food = Food.create(name: 'Pasta', measurement_unit: 'Litter', price: 10, user_id: nil)
      expect(food).to_not be_valid
    end
  end
  context 'associations' do
    it 'has many recipe_foods' do
      assc = described_class.reflect_on_association(:recipe_foods)
      expect(assc.macro).to eq :has_many
    end
    it 'has many recipes' do
      assc = described_class.reflect_on_association(:recipes)
      expect(assc.macro).to eq :has_many
    end
    it 'belong_to user' do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end
  end
end

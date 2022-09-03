require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before :each do
    @user = User.create(name: 'Chia', email: 'chia@dev.me', password: 'password', password_confirmation: 'password')
  end

  context 'validations' do
    it 'is valid with valid attributes' do
      recipe = Recipe.create(name: 'Pasta', description: 'Cameroonian Food', preparation_time: '1 hour',
                             cooking_time: '1 hour', user_id: @user.id)
      expect(recipe).to be_valid
    end
    it 'is not valid without a name' do
      recipe = Recipe.create(name: nil, description: 'Cameroonian Food', preparation_time: '1 hour',
                             cooking_time: '1 hour', user_id: @user.id)
      expect(recipe).to_not be_valid
    end
    it 'is not valid without description' do
      recipe = Recipe.create(name: 'Pasta', description: nil, preparation_time: '1 hour', cooking_time: '1 hour',
                             user_id: @user.id)
      expect(recipe).to_not be_valid
    end
    it 'is not valid without preparation time' do
      recipe = Recipe.create(name: 'Pasta', description: 'Cameroonian Food', preparation_time: nil,
                             cooking_time: '1 hour', user_id: @user.id)
      expect(recipe).to_not be_valid
    end
    it 'is not valid without cooking time' do
      recipe = Recipe.create(name: 'Pasta', description: 'Cameroonian Food', preparation_time: '1 hour',
                             cooking_time: nil, user_id: @user.id)
      expect(recipe).to_not be_valid
    end
    it 'is not valid without user id' do
      recipe = Recipe.create(name: 'Pasta', description: 'Cameroonian Food', preparation_time: '1 hour',
                             cooking_time: '1 hour', user_id: nil)
      expect(recipe).to_not be_valid
    end
  end
  context 'associations' do
    it 'has many recipe_foods' do
      assc = described_class.reflect_on_association(:recipe_foods)
      expect(assc.macro).to eq :has_many
    end
    it 'has many foods' do
      assc = described_class.reflect_on_association(:foods)
      expect(assc.macro).to eq :has_many
    end
    it 'belong_to user' do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end
  end
end

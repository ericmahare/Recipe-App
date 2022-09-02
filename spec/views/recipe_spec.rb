require 'rails_helper'

RSpec.describe Recipe, type: :view do
  before :each do
    @user = User.create(name: 'Chia', email: 'chia@dev.co', password: 'password', password_confirmation: 'password')

    @user1 = User.create(name: 'Eric', email: 'eric@dev.co', password: 'password', password_confirmation: 'password')

    @food1 = Food.create(name: 'ndole', measurement_unit: 'Litter', price: '1 hour', user_id: @user.id)
    @food3 = Food.create(name: 'fufu', measurement_unit: 'Litter', price: '1 hour', user_id: @user.id)
    @food2 = Food.create(name: 'achu', measurement_unit: 'cm', price: '1 hour', user_id: @user.id)

    @recipe = Recipe.create(name: 'Ekwang', description: 'Cameroonian Food', preparation_time: '1 hour',
                            cooking_time: '1 hour', user_id: @user.id)
    @recipe = Recipe.create(name: 'Koki', description: 'Cameroonian Food', preparation_time: 10, cooking_time: 10,
                            public: false, user_id: @user.id)
    @recipe = Recipe.create(name: 'Chigala', description: 'Kenian Food', preparation_time: '1 hour',
                            cooking_time: '1 hour', user_id: @user1.id)
  end

  context 'Visit public recipe' do
    it 'should show public recipe' do
      visit public_recipes_path
      expect(page).to have_content('Ekwang')
    end
    it 'should not show private recipe' do
      visit public_recipes_path
      expect(page).not_to have_content('Koki')
    end
    it 'requires login' do
      visit recipes_path
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end
  end
  context 'Visit private recipe' do
    it 'should show private recipe' do
      # login
      visit new_user_session_path
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      click_button 'Log in'
      visit recipes_path
      expect(page).to have_content('Ekwang')
    end
    it 'should not show private recipes from other users' do
      visit new_user_session_path
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      click_button 'Log in'
      visit recipes_path
      expect(page).not_to have_content('Elle')
    end
  end
end

require 'rails_helper'

RSpec.describe Food, type: :view do
  before :each do
    @user = User.create(name: 'Eric', email: 'eric@dev.com', password: 'password', password_confirmation: 'password')
    @food = Food.create(name: 'Chigala', measurement_unit: 'Litter', price: 10, user_id: @user.id)
  end

  context 'Visit public recipe' do
    it 'should show public recipe' do
      visit(new_user_session_path)
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      click_button 'Log in'
      visit foods_path
      expect(page).to have_content('Chigala')
    end
  end
end

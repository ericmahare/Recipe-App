require 'rails_helper'

RSpec.describe User, type: :view do
  before :each do
    @user1 = User.create(name: 'Chia', email: 'chia@dev.me', password: 'password', password_confirmation: 'password')
  end
  it 'should sign up new user' do
    visit new_user_registration_path
    fill_in 'user[name]', with: 'path'
    fill_in 'user[email]', with: 'path@dev.me'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_button 'Sign up'
    expect(current_path).to eq(root_path)
  end

  it 'should login existing user' do
    visit new_user_session_path
    fill_in 'user[email]', with: @user1.email
    fill_in 'user[password]', with: @user1.password
    click_button 'Log in'
    expect(page).to have_content('Logout')
  end
end

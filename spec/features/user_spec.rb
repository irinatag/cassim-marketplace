require 'rails_helper'

feature 'authorization' do
  # before(:each) do
  #   @user = User.make(email: 'user@test.com', password: 'password')
  # end

  scenario 'users can register' do
    visit '/products'
    click_on 'Sign Up'

    fill_in :user_email, :with => 'user@test.com'
    fill_in :user_password, :with => 'password'
    fill_in :user_password_confirmation, :with => 'password'

    click_button 'Sign up'
    expect(page).to have_content 'You have successfully signed up.'
  end

  scenario 'users can sign in' do
    @user = User.create!(email: 'user@test.com', password: 'password')

    visit '/products'
    click_on 'Sign In'
    
    fill_in :email, :with => 'user@test.com'
    fill_in :password, :with => 'password'

    click_button 'Sign in'
    expect(page).to have_content 'You have successfully signed in.'
  end
end

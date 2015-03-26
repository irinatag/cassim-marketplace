require 'rails_helper'

feature 'user registration' do
  before(:each) do
    @user = User.create!(email: 'user@test.com', password: 'password')
  end

  scenario 'users can sign in with valid email and password' do
    visit '/products'
    click_on 'Sign In'

    fill_in :email, :with => 'user@test.com'
    fill_in :password, :with => 'password'

    click_button 'Sign in'
    expect(page).to have_content 'You have successfully signed in.'
  end

  scenario 'users cannot sign in with invalid email' do
    visit '/products'
    click_on 'Sign In'

    fill_in :email, :with => 'user2@test.com'
    fill_in :password, :with => 'password'

    click_button 'Sign in'
    expect(page).to have_content 'Username / password combination is invalid'
  end

  scenario 'users cannot sign in with invalid password' do
    visit '/products'
    click_on 'Sign In'

    fill_in :email, :with => 'user@test.com'
    fill_in :password, :with => 'password1'

    click_button 'Sign in'
    expect(page).to have_content 'Username / password combination is invalid'
  end

  scenario 'users can sign out' do
    visit '/products'
    click_on 'Sign In'

    fill_in :email, :with => 'user@test.com'
    fill_in :password, :with => 'password'

    click_button 'Sign in'
    click_on 'Sign Out'

    expect(page).to have_content "You have successfully signed out."
  end
end

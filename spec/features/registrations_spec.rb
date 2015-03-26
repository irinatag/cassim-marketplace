require 'rails_helper'

feature 'user registration' do
  scenario 'users can register with matching password and confirmation' do
    visit root_path

    fill_in :user_email, :with => 'user@test.com'
    fill_in :user_password, :with => 'password'
    fill_in :user_password_confirmation, :with => 'password'

    click_button 'Sign up'
    expect(page).to have_content 'You have successfully signed up.'
  end

  scenario 'users cannot register with non-matching password and confirmation' do
    visit root_path

    fill_in :user_email, :with => 'user@test.com'
    fill_in :user_password, :with => 'password'
    fill_in :user_password_confirmation, :with => 'password1'

    click_button 'Sign up'
    expect(page).to have_content "Password confirmation doesn't match Password"
  end

  scenario 'users cannot register if email is taken' do
    @user = User.create!(email: 'user@test.com', password: 'password')

    visit root_path

    fill_in :user_email, :with => 'user@test.com'
    fill_in :user_password, :with => 'password'
    fill_in :user_password_confirmation, :with => 'password'

    click_button 'Sign up'
    expect(page).to have_content "Email has already been taken"
  end

end

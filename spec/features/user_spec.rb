require 'rails_helper'

feature 'users sign up' do
  before(:each) do
    @user = User.make(email: 'user@test.com', password: 'password')
  end

  scenario 'Sign in with correct credentials' do
    visit '/sessions/new'
    within("#session") do
      fill_in 'Email', :with => 'user@test.com'
      fill_in 'Password', :with => 'password'
    end
    click_button 'Sign in'
    expect(page).to have_content 'Success!'
  end
end

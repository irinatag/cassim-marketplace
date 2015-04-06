require 'rails_helper'

feature 'vendor admin panel' do
  it "accesses the dashboard" do
    User.create( email: 'user@example.com',
                 password: 'password',
                 password_confirmation: 'password' )

    visit root_path
    click_on 'Sign In'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Sign in'

    current_path.should eq(admin_path)

    within 'h1' do
      page.should have_content 'Administration'
      end

    page.should have_content 'Manage Products'
    page.should have_content 'Manage Vendor Profile'
  end
end

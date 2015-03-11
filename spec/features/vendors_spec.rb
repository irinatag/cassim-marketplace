require 'rails_helper'

feature 'CRUDing vendors' do
  scenario 'create a vendor' do
    visit vendors_path
    click_on "Add new vendor"
    fill_in "Name", with: "Vendor 1"
    fill_in "Description", with: "Description"
    fill_in "Email biz", with: "test@test.com"
    fill_in "Email finance", with: "test2@test.com"
    fill_in "Address", with: "44 Tehama St."
    fill_in "City", with: "San Francisco"
    fill_in "State", with: "CA"
    fill_in "Zipcode", with: "94117"
    select 'United States of America', from: "Country"
    fill_in "Phone", with: "333-333-3333"
    click_on "Submit Vendor"

    expect(page).to have_content("Vendor 1")
    expect(page).to have_content("Description")
    expect(page).to have_content("test@test.com")
    expect(page).to have_content("test2@test.com")
    expect(page).to have_content("44 Tehama St.")
    expect(page).to have_content("San Francisco")
    expect(page).to have_content("CA")
    expect(page).to have_content("94117")
    expect(page).to have_content("US")
    expect(page).to have_content("333-333-3333")
  end

  scenario 'view a vendor' do
    visit vendors_path
    click_on "Add new vendor"
    fill_in "Name", with: "Vendor 1"
    fill_in "Description", with: "Description"
    fill_in "Email biz", with: "test@test.com"
    fill_in "Email finance", with: "test2@test.com"
    fill_in "Address", with: "44 Tehama St."
    fill_in "City", with: "San Francisco"
    fill_in "State", with: "CA"
    fill_in "Zipcode", with: "94117"
    select 'United States of America', from: "Country"
    fill_in "Phone", with: "333-333-3333"
    click_on "Submit Vendor"

    expect(page).to have_content("Vendor 1")
    expect(page).to have_content("Description")
    expect(page).to have_content("test@test.com")
    expect(page).to have_content("test2@test.com")
    expect(page).to have_content("44 Tehama St.")
    expect(page).to have_content("San Francisco")
    expect(page).to have_content("CA")
    expect(page).to have_content("94117")
    expect(page).to have_content("US")
    expect(page).to have_content("333-333-3333")
  end
end

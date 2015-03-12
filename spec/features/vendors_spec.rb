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

  scenario 'view a vendor' do
    Vendor.create!(
      name: 'Vendor 2',
      description: 'Description',
      email_biz: 'test@test.com',
      email_finance: 'test2@test.com',
      address: '44 Tehama St.',
      city: 'SF',
      state: 'CA',
      zipcode: '00000',
      country: 'United States of America',
      phone: '333-333-3333'
    )

    visit vendors_path
    click_on "Vendor 2"
    expect(page).to have_content("Vendor 2")
    expect(page).to have_content("Description")
    expect(page).to have_content("test@test.com")
    expect(page).to have_content("test2@test.com")
    expect(page).to have_content("44 Tehama St.")
    expect(page).to have_content("SF")
    expect(page).to have_content("CA")
    expect(page).to have_content("00000")
    expect(page).to have_content("United States of America")
    expect(page).to have_content("333-333-3333")
  end

end

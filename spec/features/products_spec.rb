require 'rails_helper'

feature 'CRUDing products' do
  scenario 'create a product' do
    visit products_path
    click_on "Add new product"
    fill_in "Name", with: "Product 1"
    fill_in "Description", with: "Description of product 1"
    fill_in "Quantity", with: "1000"
    fill_in "Price", with: "22.50"
    fill_in "Moq", with: "50"
    fill_in "When ready", with: "now"
    fill_in "Brand", with: "ACME"
    fill_in "Sku", with: "fkrr2qBZ"
    fill_in "Mfr", with: "6kqX6FbX"
    fill_in "Msrp", with: "69.99"
    fill_in "Manufacturer", with: "ACME Co."
    fill_in "Category1", with: "electronics"
    fill_in "Category2", with: "kitchen appliances"
    fill_in "Upc", with: "702037443"
    fill_in "Restrictions", with: "none"
    fill_in "Warehouse zip", with: "02345"
    fill_in "Warranty", with: "2 year, manufacturer warranty"
    fill_in "Link1", with: "http://www.amazon.com"
    fill_in "Link1 title", with: "Amazon Link"
    fill_in "Link2", with: "http://www.google.com"
    fill_in "Link2 title", with: "Google Link"
    click_on "Submit Product"

    expect(page).to have_content("Product 1")
    expect(page).to have_content("Description of product 1")
    expect(page).to have_content("1000")
    expect(page).to have_content("$22.50")
    expect(page).to have_content("50")
    expect(page).to have_content("now")
    expect(page).to have_content("ACME")
    expect(page).to have_content("fkrr2qBZ")
    expect(page).to have_content("6kqX6FbX")
    expect(page).to have_content("$69.99")
    expect(page).to have_content("ACME Co.")
    expect(page).to have_content("electronics")
    expect(page).to have_content("kitchen appliances")
    expect(page).to have_content("702037443")
    expect(page).to have_content("none")
    expect(page).to have_content("02345")
    expect(page).to have_content("2 year, manufacturer warranty")
    expect(page).to have_content("Google Link")
    expect(page).to have_content("Amazon Link")

  end
end

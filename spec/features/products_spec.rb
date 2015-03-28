require 'rails_helper'

feature 'CRUDing products' do
  scenario 'create a product' do
    Vendor.create(
    :name => 'Vendor Name',
    :email_biz => 'fake@fake.com',
    :email_finance => 'anon@anon.com',
    :address => '123 4th St',
    :city => 'Springfield',
    :state => 'East Dakota',
    :zipcode => '98765',
    :phone => '123-456-7890'
    )

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
    select("Vendor Name", :from => "Vendor")
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
    expect(page).to have_content("22.50")
    expect(page).to have_content("50")
    expect(page).to have_content("ACME")
    expect(page).to have_content("fkrr2qBZ")
    expect(page).to have_content("6kqX6FbX")
    expect(page).to have_content("69.99")
    expect(page).to have_content("electronics")
    expect(page).to have_content("kitchen appliances")
    expect(page).to have_content("702037443")
    expect(page).to have_content("none")
    expect(page).to have_content("02345")
    expect(page).to have_content("2 year, manufacturer warranty")
    expect(page).to have_content("Google Link")
    expect(page).to have_content("Amazon Link")
  end

  scenario 'view a product' do
    vendor = Vendor.create(
    :name => 'ACME Co.',
    :email_biz => 'email_biz@test.com',
    :email_finance => 'anon@anon.com',
    :address => '123 4th St',
    :city => 'Springfield',
    :state => 'East Dakota',
    :zipcode => '98765',
    :phone => '123-456-7890'
    )

    Product.create(
      name: 'Product 2',
      description: 'This is another product',
      quantity: 2000,
      price: 50.00,
      moq: 50,
      when_ready: 'now',
      brand: 'ACME',
      sku: 'qwerty',
      mfr: 'asdf',
      msrp: 74.99,
      vendor: vendor,
      category1: 'household goods',
      category2: 'kitchen appliances',
      upc: 123456789,
      restrictions: 'none',
      warehouse_zip: '60013',
      warranty: '2 year limited manufacturer warranty',
      link1: "www.google.com",
      link1_title: "Google",
    )

    visit products_path
    click_on "See More"
    expect(page).to have_content('Product 2')
    expect(page).to have_content('This is another product')
    expect(page).to have_content('2000')
    expect(page).to have_content('$50.00')
    expect(page).to have_content('50')
    expect(page).to have_content('ACME')
    expect(page).to have_content('qwerty')
    expect(page).to have_content('asdf')
    expect(page).to have_content('74.99')
    expect(page).to have_content('household goods')
    expect(page).to have_content('kitchen appliances')
    expect(page).to have_content('123456789')
    expect(page).to have_content('none')
    expect(page).to have_content('60013')
    expect(page).to have_content('2 year limited manufacturer warranty')
    expect(page).to have_content('Google')
  end

  scenario 'edit a product' do
    vendor = Vendor.create(
    :name => 'ACME Co.',
    :email_biz => 'fake@fake.com',
    :email_finance => 'anon@anon.com',
    :address => '123 4th St',
    :city => 'Springfield',
    :state => 'East Dakota',
    :zipcode => '98765',
    :phone => '123-456-7890'
    )

    new_vendor = Vendor.create(
    :name => 'ABC123',
    :email_biz => 'fake@fake.com',
    :email_finance => 'anon@anon.com',
    :address => '123 4th St',
    :city => 'Springfield',
    :state => 'East Dakota',
    :zipcode => '98765',
    :phone => '123-456-7890')

    Product.create(
      name: 'Product 2',
      description: 'This is another product',
      quantity: 2000,
      price: 50.00,
      moq: 50,
      when_ready: 'now',
      brand: 'ACME',
      sku: 'qwerty',
      mfr: 'asdf',
      msrp: 74.99,
      vendor: vendor,
      category1: 'household goods',
      category2: 'kitchen appliances',
      upc: 123456789,
      restrictions: 'none',
      warehouse_zip: '60013',
      warranty: '2 year limited manufacturer warranty',
      link1: "www.google.com",
      link1_title: "Google",
    )

    visit products_path
    click_on "See More"
    click_on 'Edit'
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
    select("ABC123", :from => "Vendor")
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

    click_on 'Update product'

    expect(page).to have_content("Product 1")
    expect(page).to have_content("Description of product 1")
    expect(page).to have_content("1000")
    expect(page).to have_content("$22.50")
    expect(page).to have_content("50")
    expect(page).to have_content("now")
    expect(page).to have_content("ACME")
    expect(page).to have_content("fkrr2qBZ")
    expect(page).to have_content("6kqX6FbX")
    expect(page).to have_content("69.99")
    expect(page).to have_content("electronics")
    expect(page).to have_content("kitchen appliances")
    expect(page).to have_content("702037443")
    expect(page).to have_content("none")
    expect(page).to have_content("02345")
    expect(page).to have_content("2 year, manufacturer warranty")
    expect(page).to have_content("Google Link")
    expect(page).to have_content("Amazon Link")
  end

  scenario 'delete a product' do
    vendor = Vendor.create(
      :name => 'ACME Co.',
      :email_biz => 'fake@fake.com',
      :email_finance => 'anon@anon.com',
      :address => '123 4th St',
      :city => 'Springfield',
      :state => 'East Dakota',
      :zipcode => '98765',
      :phone => '123-456-7890'
      )

    Product.create(
      name: 'Product 2',
      description: 'This is another product',
      quantity: 2000,
      price: 50.00,
      moq: 50,
      when_ready: 'now',
      brand: 'ACME',
      sku: 'qwerty',
      mfr: 'asdf',
      msrp: 74.99,
      vendor: vendor,
      category1: 'household goods',
      category2: 'kitchen appliances',
      upc: 123456789,
      restrictions: 'none',
      warehouse_zip: '60013',
      warranty: '2 year limited manufacturer warranty',
      link1: "www.google.com",
      link1_title: "Google",
    )

    visit products_path
    click_on "See More"
    click_on "Delete"

    expect(page).to have_no_content('Product 2')
  end
end

feature 'reserving a product' do
  scenario 'user reserves some products' do
    vendor = Vendor.create(
      :name => 'ACME',
      :email_biz => 'fake@fake.com',
      :email_finance => 'anon@anon.com',
      :address => '123 4th St',
      :city => 'Springfield',
      :state => 'East Dakota',
      :zipcode => '98765',
      :phone => '123-456-7890'
    )

    Product.create(
      name: 'Product 2',
      description: 'This is another product',
      quantity: 2000,
      price: 50.00,
      moq: 50,
      when_ready: 'now',
      brand: 'ACME',
      sku: 'qwerty',
      mfr: 'asdf',
      msrp: 74.99,
      vendor: vendor,
      category1: 'household goods',
      category2: 'kitchen appliances',
      upc: 123456789,
      restrictions: 'none',
      warehouse_zip: '60013',
      warranty: '2 year limited manufacturer warranty',
      link1: "www.google.com",
      link1_title: "Google",
    )

    visit products_path
    click_on "See More"
    click_on "Reserve"

  end
end

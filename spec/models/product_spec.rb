require 'rails_helper'

describe Product do
  describe 'products are crudded in database' do
    let(:vendor) {
      Vendor.create(
      :name => 'ACME',
      :email_biz => 'fake@fake.com',
      :email_finance => 'anon@anon.com',
      :address => '123 4th St',
      :city => 'Springfield',
      :state => 'East Dakota',
      :zipcode => '98765',
      :phone => '123-456-7890',
      )
    }
    it 'saves a product' do
      product = Product.new(
        :name => 'A Product',
        :description => 'a thing',
        :quantity => 400,
        :vendor => vendor,
        :price => 55.5,
        :moq => 500
      )
      product.save
      total = Product.all.count

      expect(total).to eq(1)
    end

    it 'deletes a product' do
      product = Product.new(
      :name => 'A Product',
      :description => 'a thing',
      :quantity => 400,
      :vendor => vendor,
      :price => 55.5,
      :moq => 500
      )
      total = Product.all.count
      product.save
      product.delete
      total = Product.all.count

      expect(total).to eq(0)
    end

    it 'edits a product' do
      product = Product.new(:name => 'A Product',
        :description => 'a thing',
        :quantity => 400,
        :vendor => vendor,
        :price => 55.5,
        :moq => 500
      )
      product.save
      product.name = 'A New Product'
      expect(product.name).to eq('A New Product')
    end

    it 'does not save a blank product' do
      product = Product.new
      product.valid?

      expect(product.errors.has_key?(:name)).to eq(true)
      expect(product.errors.has_key?(:description)).to eq(true)
      expect(product.errors.has_key?(:quantity)).to eq(true)
      expect(product.errors.has_key?(:price)).to eq(true)
      expect(product.errors.has_key?(:moq)).to eq(true)
      expect(product.errors.has_key?(:vendor)).to eq(true)
    end
  end

  describe 'products can be reserved' do
    vendor = Vendor.new(
      :name => 'ACME',
      :email_biz => 'fake@fake.com',
      :email_finance => 'anon@anon.com',
      :address => '123 4th St', :city => 'Springfield',
      :state => 'East Dakota', :zipcode => '98765',
      :phone => '123-456-7890'
    )

    it 'decreases available quantity upon reservation' do
      product = Product.new(
        :name => 'A Product',
        :description => 'a thing',
        :quantity => 400,
        :vendor => vendor,
        :price => 55.5,
        :moq => 20
      )
      product.save

      product.reserve(50)
      total = product.quantity

      expect(total).to eq(350)
    end

    it 'does not reserve if the requested quantity is below the total quantity' do
      product = Product.new(
        :name => 'A Product',
        :description => 'a thing',
        :quantity => 5,
        :vendor => vendor,
        :price => 55.5,
        :moq => 20
      )
      product.save
      product.reserve(10)
      total = product.quantity

      expect(total).to eq(5)
    end

    it 'does not reserve if the requested quantity is below MOQ' do
      product = Product.new(
        :name => 'A Product',
        :description => 'a thing',
        :quantity => 400,
        :vendor => vendor,
        :price => 55.5,
        :moq => 20
      )
      product.save
      product.reserve(10)
      total = product.quantity

      expect(total).to eq(400)
    end
  end
end

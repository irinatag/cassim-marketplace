require 'rails_helper'

describe Vendor do
  describe 'validations' do
    it 'requires a name' do
      vendor = Vendor.new

      vendor.valid?

      expect(vendor.errors.has_key?(:name)).to eq(true)
    end

    it 'requires a business email' do
      vendor = Vendor.new

      vendor.valid?

      expect(vendor.errors.has_key?(:email_biz)).to eq(true)
    end

    it 'requires a finance email' do
      vendor = Vendor.new

      vendor.valid?

      expect(vendor.errors.has_key?(:email_finance)).to eq(true)
    end

    it 'requires an address' do
      vendor = Vendor.new

      vendor.valid?

      expect(vendor.errors.has_key?(:address)).to eq(true)
    end

    it 'requires a city' do
      vendor = Vendor.new

      vendor.valid?

      expect(vendor.errors.has_key?(:city)).to eq(true)
    end

    it 'requires a state' do
      vendor = Vendor.new

      vendor.valid?

      expect(vendor.errors.has_key?(:state)).to eq(true)
    end

    it 'requires a zipcode' do
      vendor = Vendor.new

      vendor.valid?

      expect(vendor.errors.has_key?(:zipcode)).to eq(true)
    end

    it 'requires a phone' do
      vendor = Vendor.new

      vendor.valid?

      expect(vendor.errors.has_key?(:phone)).to eq(true)
    end

  end

  describe 'associations' do
    it 'has many products' do
      vendor = create(:vendor)

      product = vendor.products.create!(
                name: 'name',
                description: 'desc',
                price: '1',
                quantity: '1',
                moq: 'moq')
                
      expect(product.vendor_id).to eq(vendor.id)
    end
  end
end

class Vendor < ActiveRecord::Base
  validates :name, :email_biz, :email_finance, :address, :city, :state, :zipcode, :phone, presence: true
  has_many :products
end

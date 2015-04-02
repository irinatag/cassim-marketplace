class Vendor < ActiveRecord::Base
  validates :name,
    # :email_biz,
    # :address,
    # :city,
    # :state,
    # :zipcode,
    # :phone,
    presence: true

  has_many :products
end

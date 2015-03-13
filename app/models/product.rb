class Product < ActiveRecord::Base
  validates :name, :description, :quantity, :price, :vendor, :moq, presence: true
  belongs_to :vendor
end

class Product < ActiveRecord::Base
  validates :name, :description, :quantity, :price, :moq, presence: true
end

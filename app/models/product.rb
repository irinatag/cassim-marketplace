class Product < ActiveRecord::Base
  has_attached_file :image
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/gif', 'image/png', 'image/jpg']
  validates :name, :description, :quantity, :price, :moq, presence: true
end

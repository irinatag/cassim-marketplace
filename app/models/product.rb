class Product < ActiveRecord::Base
  has_attached_file :image
  validates_attachment_content_type :image,
    :content_type => [
      'image/jpeg',
      'image/gif',
      'image/png',
      'image/jpg'
    ]

  validates :name,
    :description,
    :quantity,
    :price,
    :vendor,
    :moq,
    presence: true

  belongs_to :vendor

  def reserve(qty)
    integer_qty = qty.to_i
    if integer_qty >= self.moq && integer_qty <= self.quantity
      self.quantity -= integer_qty
      self.save
    end
  end

  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("name like ?", "%#{query}%") # returns products whose names contain one or more words that form the query
  end
end

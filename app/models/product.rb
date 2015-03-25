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
  # :vendor,
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

  def self.search(params)
    tire.search(load: true) do
      query { string params[:search] } if params[:search].present?
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Product.create! row.to_hash
    end
  end

  include Tire::Model::Search
  include Tire::Model::Callbacks
end

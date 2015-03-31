class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  has_secure_password

  self.inheritance_column = :role

  def self.roles
    %w(Vendor Buyer)
  end

  scope :buyers, -> {where(role: 'Buyer')}

  def vendor?
    role == 'Vendor'
  end

end

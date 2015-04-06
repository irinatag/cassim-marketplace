class AddIconstoVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :etsy_avatar_image_url, :string
    add_attachment :vendors, :avatar
  end
end

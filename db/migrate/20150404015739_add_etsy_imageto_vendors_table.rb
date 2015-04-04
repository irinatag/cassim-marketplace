class AddEtsyImagetoVendorsTable < ActiveRecord::Migration
  def change
    add_column :vendors, :etsy_profile_image_url, :string
  end
end

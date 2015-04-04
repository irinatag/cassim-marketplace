class AddVendorImagetoVendorsTable < ActiveRecord::Migration
  def change
    add_attachment :vendors, :image
  end

end

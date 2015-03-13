class AddVendorIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :vendor_id, :integer
  end
end

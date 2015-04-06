class AddOwnerNameToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :owner_name, :string
  end
end

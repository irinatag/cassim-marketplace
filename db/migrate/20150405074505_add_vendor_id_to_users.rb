class AddVendorIdToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :vendor
  end
end

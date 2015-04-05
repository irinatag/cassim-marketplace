class AddIsVendorBooleantoUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_vendor?, :boolean, default: :false
  end
end

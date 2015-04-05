class AddVendorBooleantoUsers < ActiveRecord::Migration
  def change
    remove_column :users, :role, :string
    add_column :users, :is_vendor?, :boolean, default: :false
  end
end

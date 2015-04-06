class AddTaglineToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :tagline, :string
  end
end

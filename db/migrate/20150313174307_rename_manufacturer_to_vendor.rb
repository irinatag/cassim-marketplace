class RenameManufacturerToVendor < ActiveRecord::Migration
  def change
    rename_column :products, :manufacturer, :vendor
  end
end

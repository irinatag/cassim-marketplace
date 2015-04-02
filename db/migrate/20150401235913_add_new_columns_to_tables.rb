class AddNewColumnsToTables < ActiveRecord::Migration
  def change
    add_column :products, :properties, :string
    remove_column :products, :mfr, :string
  end
end

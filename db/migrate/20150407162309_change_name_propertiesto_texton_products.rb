class ChangeNamePropertiestoTextonProducts < ActiveRecord::Migration
  def change
    change_column :products, :name, :text
    change_column :products, :properties, :text
  end
end

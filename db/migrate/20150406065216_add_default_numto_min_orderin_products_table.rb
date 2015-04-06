class AddDefaultNumtoMinOrderinProductsTable < ActiveRecord::Migration
  def change
    change_column :products, :moq, :integer, default: 1
  end
end

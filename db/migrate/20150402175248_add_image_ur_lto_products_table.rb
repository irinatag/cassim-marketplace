class AddImageUrLtoProductsTable < ActiveRecord::Migration
  def change
    add_column :products, :image_url, :string
  end
end

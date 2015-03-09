class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.integer :quantity
      t.decimal :price
      t.integer :moq
      t.string :when_ready
      t.string :brand
      t.string :sku
      t.string :mfr
      t.decimal :msrp
      t.string :manufacturer
      t.string :category1
      t.string :category2
      t.integer :upc
      t.string :restrictions
      t.string :warehouse_zip
      t.string :warranty
      t.string :link1
      t.string :link2
      t.string :link1_title
      t.string :link2_title

      t.timestamps
    end
  end
end

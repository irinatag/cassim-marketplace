class UpcIntegerToFloat < ActiveRecord::Migration
  def change
    change_column :products, :upc, :float

  end
end

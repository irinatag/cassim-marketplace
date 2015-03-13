class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :email_biz
      t.string :email_finance
      t.string :description
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :country
      t.string :phone

      t.timestamps
    end
  end
end

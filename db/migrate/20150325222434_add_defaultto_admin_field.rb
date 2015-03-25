class AddDefaulttoAdminField < ActiveRecord::Migration
  def change
    change_column :users, :admin, :boolean, null: false, default: false
  end
end

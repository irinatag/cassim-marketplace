class ChangeDataTypeforDescriptions < ActiveRecord::Migration
  def change
    change_column :vendors, :description, :text
  end
end

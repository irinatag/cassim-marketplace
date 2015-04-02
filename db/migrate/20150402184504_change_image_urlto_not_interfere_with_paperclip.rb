class ChangeImageUrltoNotInterfereWithPaperclip < ActiveRecord::Migration
  def change
    rename_column :products, :image_url, :etsy_image_url
  end
end

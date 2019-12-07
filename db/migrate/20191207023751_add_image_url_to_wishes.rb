class AddImageUrlToWishes < ActiveRecord::Migration[5.2]
  def change
    add_column :wishes, :image_url, :string
  end
end

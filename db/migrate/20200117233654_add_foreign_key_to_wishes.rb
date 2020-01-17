class AddForeignKeyToWishes < ActiveRecord::Migration[5.2]
  def change
    add_column :wishes, :zoo_id, :integer
  end
end

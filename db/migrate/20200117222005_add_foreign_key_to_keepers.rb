class AddForeignKeyToKeepers < ActiveRecord::Migration[5.2]
  def change
    add_column :keepers, :zoo_id, :integer
  end
end

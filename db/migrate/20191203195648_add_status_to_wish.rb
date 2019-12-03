class AddStatusToWish < ActiveRecord::Migration[5.2]
  def change
    add_column :wishes, :status, :string, :default => "new"
  end
end

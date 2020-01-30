class AddColumnsToWishes < ActiveRecord::Migration[5.2]
  def change
    add_column :wishes, :message, :string
    add_column :wishes, :current_funding, :float, default: 0.00
    add_column :wishes, :total_to_fund, :float
  end
end

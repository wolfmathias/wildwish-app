class AddColumnsToToys < ActiveRecord::Migration[5.2]
  def change
    add_column :toys, :name, :string
    add_column :toys, :description, :string
    add_column :toys, :cost, :float
  end
end

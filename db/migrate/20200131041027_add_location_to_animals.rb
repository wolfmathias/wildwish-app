class AddLocationToAnimals < ActiveRecord::Migration[5.2]
  def change
    add_column :animals, :location, :string
  end
end

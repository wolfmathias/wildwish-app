class CreateAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table :animals do |t|
      t.string :name
      t.string :species
      t.string :bio
      t.references :keeper, foreign_key: true
      t.timestamps
    end
  end
end

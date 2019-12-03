class CreateWishes < ActiveRecord::Migration[5.2]
  def change
    create_table :wishes do |t|
      
      t.references :animal, foreign_key: true
      t.references :toy, foreign_key: true

      t.timestamps
    end
  end
end

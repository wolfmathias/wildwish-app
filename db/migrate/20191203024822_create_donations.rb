class CreateDonations < ActiveRecord::Migration[5.2]
  def change
    create_table :donations do |t|

      t.references :donor, null: false, foreign_key: true
      t.references :wish, foreign_key: true
      
      t.timestamps
    end
  end
end

class CreateWishes < ActiveRecord::Migration[5.2]
  def change
    create_table :wishes do |t|

      t.timestamps
    end
  end
end

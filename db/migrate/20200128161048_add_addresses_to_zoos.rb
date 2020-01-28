class AddAddressesToZoos < ActiveRecord::Migration[5.2]
  def change
    add_reference :addresses, :zoo, foreign_key: true
  end
end

class AddAddressesToZoos < ActiveRecord::Migration[5.2]
  def change
    add_reference :zoos, :address, foreign_key: true
  end
end

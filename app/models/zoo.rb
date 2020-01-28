class Zoo < ApplicationRecord
    has_many :keepers
    has_many :wishes
    has_one :address

    accepts_nested_attributes_for :address


    # def address_attributes=()
    #     self.create_address(state: st)
    # end
end

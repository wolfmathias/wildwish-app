class Donor < ApplicationRecord
    # associations
    # belongs_to taken out to allow standalone creation
    # will still have 'user_id' column
    # belongs_to :user
    has_many :donations
    has_many :wishes, through: :donations
    has_many :toys, through: :wishes
    has_many :animals, through: :wishes
    
    #accepts_nested_attributes_for :donations

    
end

class Donor < ApplicationRecord
    # associations
    belongs_to :user
    has_many :donations
    has_many :wishes, through: :donations
    has_many :toys, through: :wishes
    has_many :animals, through: :wishes
    
end

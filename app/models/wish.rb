class Wish < ApplicationRecord
    # associations
    belongs_to :animal
    belongs_to :toy
    has_many :donations
    has_many :donors, through: :donations
    has_one :user, through: :animal
    
    # statuses: new, active, funded, ordered, shipped, delivered, fulfilled
    
end

class Wish < ApplicationRecord
    # associations
    belongs_to :animal
    belongs_to :toy
    has_many :donations
    has_many :donors, through: :donations
    
    # statuses: new, active, funded, ordered, shipped, delivered, fulfilled
    
    def keeper_id
        self.animal.keeper.id
    end

end

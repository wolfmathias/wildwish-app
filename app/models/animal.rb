class Animal < ApplicationRecord
    # associations
    belongs_to :keeper
    has_many :wishes, dependent: :delete_all # this needs to change so wishes other than 'new' status are archived
    has_many :toys, through: :wishes
    has_many :donations, through: :wishes
    has_many :donors, through: :donations

    # Active Storeage file associations
    has_many_attached :images

    # below method for frontend JS concept
    # TOO MANY DOTS!
    def location
        self.keeper.zoo.name + " - " + self.keeper.zoo.address.state + ", " + self.keeper.zoo.address.country
    end
    
end

class Donor < ApplicationRecord
    # associations
    has_many :donations
    has_many :wishes, through: :donations
    has_many :toys, through: :wishes
    has_many :animals, through: :wishes
    
    # belongs_to taken out to allow standalone creation
    # will still have 'user_id' column
    # use 'user' method to call on user

    #accepts_nested_attributes_for :donations

    ## scopes
    # scope for donors that have accounts
    # scope :has_account, -> { where(:user_id.exists?) 

    def user
        User.find_by(id: self.user_id)
    end
    
end

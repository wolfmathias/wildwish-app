class Donor < ApplicationRecord
    has_many :donations
    has_many :wishes, through: :donations
    has_many :toys, through: :wishes
    has_many :animals, through: :wishes
    belongs_to :user, optional: true
end

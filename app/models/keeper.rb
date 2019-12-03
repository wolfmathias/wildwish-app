class Keeper < ApplicationRecord
    # associations
    belongs_to :user
    has_many :addresses
    has_many :animals
    has_many :wishes, through: :animals
    has_many :toys, through: :wishes
    accepts_nested_attributes_for :animals

end

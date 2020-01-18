class Zoo < ApplicationRecord
    has_many :keepers
    has_many :wishes
end

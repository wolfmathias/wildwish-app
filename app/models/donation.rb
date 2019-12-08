class Donation < ApplicationRecord
    belongs_to :donor
    belongs_to :wish

    def donor_attributes=(donor_atts)
        if donor = Donor.find_or_create_by(email: donor_atts[:email])
            donor.first_name = donor_atts[:first_name]
            donor.last_name = donor_atts[:last_name]
            donor.save
        end
    end
end

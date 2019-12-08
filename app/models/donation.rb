class Donation < ApplicationRecord
    belongs_to :donor
    belongs_to :wish

    def donor_attributes=(donor_atts)
        # find donor by id in case user enters different email than what they have used previously
        # then use rest of provided info to update donor
        # currently, many donor models can have same email if they were created without also creating an account
        self.donor = Donor.find_or_create_by(id: donor_atts[:id])
        self.donor.first_name = donor_atts[:first_name]
        self.donor.last_name = donor_atts[:last_name]
        self.donor.save
        # self.donor.update(donor_atts)
    end

    def animal_name
        self.wish.animal.name
    end

end

# donation = Donation.new(:wish_id => "8", :donor_attributes =>[:id => "4", :first_name=> "Bruce", :last_name => "Wayne", :email => "brucewayne@batcave.com"])
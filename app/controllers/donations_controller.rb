class DonationsController < ApplicationController
    
    def new
        # use cancan to set?
        if user_signed_in? # set as current_user.donor
            donor = Donor.find_or_create_by(user_id: current_user.id)
        else
            donor = Donor.new
        end
        @donation = donor.donations.build(wish_id: params[:wish_id])
    end

    def create
        @donation = @donation = Donation.new(donation_params)
    end

    # /animals/5/wishes/8/donations/new

    private

    def donation_params
        params.require(:donation).permit(
            :wish_id,
        )
    end
end

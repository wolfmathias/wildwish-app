class DonationsController < ApplicationController
    
    def new
        # use cancan to set?
        if user_signed_in? 
            donor = current_user.set_donor
            # @donor.save
            
        else
            donor = Donor.new
        end
         @donation = donor.donations.build(wish_id: params[:wish_id])
         
    end

    def create
        # raise params.inspect
        @donation = Donation.create(donation_params)
        print @donation.errors
        byebug
    end

    # /animals/5/wishes/8/donations/new

    private

    def donation_params
        params.require(:donation).permit(:wish_id, donor_attributes: [:first_name, :last_name, :email])
    end
end

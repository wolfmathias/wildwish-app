class DonationsController < ApplicationController
    load_and_authorize_resource only: [:index, :show]

    def show
    end

    def index
    end
   
    def new
        # use cancan to set?
        if user_signed_in? 
            donor = current_user.set_donor
        else
            donor = Donor.new
        end
        @donation = donor.donations.build(wish_id: params[:wish_id])

    end

    def create
        # create and save donation, if failed rerender form with errors
        # if user has account and is signed in, redirect to profile (change to donations index?)
        # if donation was made without creating account, redirect to home page
        @donation = Donation.new(donation_params)
        if @donation.save
            if user_signed_in?
                redirect_to donations_path 
            else
                redirect_to root_path
            end
        else
            render "new"
        end
    end

    # /animals/5/wishes/8/donations/new

    private

    def donation_params
        params.require(:donation).permit(:wish_id, donor_attributes: [:id, :first_name, :last_name, :email])
    end
end

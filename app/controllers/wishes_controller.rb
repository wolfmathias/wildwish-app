class WishesController < ApplicationController

    # display form for creating new wish, set animal for collection
    # route needs to be nested within animals resource
    before_action :authenticate_user!, except: [:index, :active, :reset_donations]
    load_and_authorize_resource except: [:index, :active, :reset_donations]

    def index
        
    end

    def new 
        # set animal 
        @animal = Animal.find_by(id: params[:animal_id])
    end

    def edit

    end

    def show
        @wish = Wish.find_by(id: params[:id])
    end

    def index
        
    end

    # display all wishes that are set to active
    def active
        wishes = Wish.active
        render json: wishes, include: [:animal, :toy]
    end

    # display all fulfilled wishes
    def fulfilled

    end

    # POST method for frontend JS concept
    def reset_donations
        wish = Wish.find_by(wish_params)
        wish.donations.each { |donation| donation.destroy }
        render json: wish, include: [:animal, :toy]
    end

    private

    def wish_params
        params.require(:wish).permit(:id, :image_urls) # actual attribute will be different once image uploading functionality is built
    end

end

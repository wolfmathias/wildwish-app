class WishesController < ApplicationController

    # display form for creating new wish, set animal for collection
    # route needs to be nested within animals resource
    
    # below commented out so authentication/authorization will not be needed for vanilla JS concept
    # before_action :authenticate_user!, except: [:index, :active, :reset_donations, :reset_active_wishes]
    # load_and_authorize_resource except: [:index, :active, :reset_donations, :reset_active_wishes]

    # for creating wishes using animal id and toy id
    def create
        animal = Animal.find_by(id: wish_params[:animal_id])
        wish = animal.wishes.new(toy_id: wish_params[:toy_id])
        if wish.valid?
            wish.save
            render json: wish, include: [:animal, :toy]
        else
            render json: wish.errors
        end
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
        wishes = Wish.fulfilled
        render json: wishes, include: [:animal, :toy]
    end

    # below two methods for frontend js concept
    # DO NOT INCLUDE IN PRODUCTION
    def reset_donations
        wish = Wish.find_by(wish_params)
        wish.donations.each { |donation| donation.destroy }
        render json: wish, include: [:animal, :toy]
    end

    def reset_active_wishes
        Donation.destroy_all
        Wish.reset_active_wishes
        wishes = Wish.active
        render json: wishes, include: [:animal, :toy]
    end

    private

    def wish_params
        params.require(:wish).permit(:id, :animal_id, :toy_id) # actual attribute will be different once image uploading functionality is built
    end

end

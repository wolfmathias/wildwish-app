class WishesController < ApplicationController

    # display form for creating new wish, set animal for collection
    # route needs to be nested within animals resource
    before_action :authenticate_user!, except: [:index, :active]
    load_and_authorize_resource except: [:index, :active]

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
        render json: wishes, include: [:animal], except: [:created_at, :updated_at]
    end

    # display all fulfilled wishes
    def fulfilled

    end

    private

    def wish_params
        params.require(:wish).permit.(:image_urls) # actual attribute will be different once image uploading functionality is built
    end

end

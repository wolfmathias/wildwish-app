class WishesController < ApplicationController

    # display form for creating new wish, set animal for collection
    # route needs to be nested within animals resource
    def new 
        # set animal 
        @animal = Animal.find_by(id: params[:animal_id])
    end

    
end

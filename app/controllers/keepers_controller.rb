class KeepersController < ApplicationController

    def new
        # use @keeper for instance variable to avoid conflict/confusion since current_user returns @user
        if current_user.keeper
            redirect_to keeper_path(current_user.keeper)
        else
            @keeper = current_user.build_keeper
            @keeper.animals.build
        end
        
    end

    def create
        @keeper = current_user.build_keeper(keeper_params)
        if @keeper.save
            redirect_to keeper_path(@keeper)
        else
            render 'keepers/new'
        end
    end

    def show
        
    end

    # def index
    # end

    private
    def keeper_params
        params.require(:keeper).permit(
            animals_attributes: [
                :name, 
                :species, 
                :bio, 
                toy_ids: []
            ]
        )
    end
    
end

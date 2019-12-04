class AnimalsController < ApplicationController
    # add authentication and authorization checks before appropriate methods

    def new
        @animal = current_user.keeper.animals.build
    end

    def create
        # raise params.inspect
        @animal = current_user.keeper.animals.build(animal_params)
        if @animal.save
            redirect_to animal_path(@animal)
        else
            render 'animals/new'
        end
    end

    def show
        @animal = Animal.find_by(id: params[:id])
    end

    private

    def animal_params
        params.require(:animal).permit(:name, :species, :bio, toy_ids: [])
    end

end

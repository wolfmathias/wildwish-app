class AnimalsController < ApplicationController
    # add authentication and authorization checks before appropriate methods
    # use cancancan to set resources
    before_action :set_animal, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource

    def index
    end

    def new
        @animal = current_user.keeper.animals.build
    end

    def create
        @animal = current_user.keeper.animals.build(animal_params)
        if @animal.species == "Tiger"
            puts "Made a kitty =^.^="
        end
        if @animal.save
            redirect_to animal_path(@animal)
        else
            render 'animals/new'
        end
    end

    def update 
        
        if @animal.update(animal_params)
            redirect_to animal_path(@animal)
        else
            render 'animals/edit'
        end
    end

    def destroy
        @animal.destroy
        redirect_to animals_path
    end

    private

    def set_animal
        @animal = Animal.find_by(id: params[:id])
    end

    def animal_params
        params.require(:animal).permit(:id, :name, :species, :bio, toy_ids: [])
    end

end

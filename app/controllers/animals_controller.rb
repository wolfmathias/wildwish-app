class AnimalsController < ApplicationController
    # add authentication and authorization checks before appropriate methods
    # use cancancan to set resources
    before_action :set_animal, only: [:show, :edit, :update, :destroy]
    # load_and_authorize_resource

    def index
        # animals = Animal.all

        # For react demo:
        animals = User.find_by(first_name: "Paul", last_name: "Blart").keeper.animals

        render json: animals
    end

    def new
        @animal = current_user.keeper.animals.build
    end

    def create
        # Get user from session params (current_user from Devise gem)
        # @animal = current_user.keeper.animals.build(animal_params)
        
        # Use demo keeper for developing react demo:
        @animal = User.find_by(first_name: "Paul", last_name: "Blart").keeper.animals.build(animal_params)

        # This line is really important
        if @animal.species == "Tiger" || @animal.species == "Lion"
            puts "Made a kitty =^.^="
        end

        if @animal.save
            render json: @animal
            # redirect_to animal_path(@animal)
        else
            render json: @animal.errors
            # render 'animals/new'
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
        # For react demo:
        @animal = Animal.find_by(animal_params)
        
        @animal.destroy
        render json: @animal
    end

    private

    def set_animal
        @animal = Animal.find_by(id: params[:id])
    end

    def animal_params
        params.require(:animal).permit(:id, :name, :species, :bio, toy_ids: [], images: [])
    end

end

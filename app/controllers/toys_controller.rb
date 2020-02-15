class ToysController < ApplicationController

    def index
        toys = Toy.all
        render json: toys
    end

end

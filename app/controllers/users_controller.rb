class UsersController < ApplicationController
    before_action :authenticate_user!
    
    def show

    end

    def home
        if user_signed_in?
            redirect_to user_path(current_user)
        else
            render '/landing'
        end
    end

end

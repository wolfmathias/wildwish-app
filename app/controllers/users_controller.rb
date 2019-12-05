class UsersController < ApplicationController
    before_action :authenticate_user!
    
    def show
        if current_user.keeper?
            redirect_to keeper_path(current_user)
        end
    end

    def home
        # binding.pry
        # if user_signed_in?
        #     redirect_to user_path(current_user)
        # else
            render '/landing'
        # end
    end

end

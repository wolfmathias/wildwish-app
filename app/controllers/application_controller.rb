class ApplicationController < ActionController::Base

    def home
        render '/landing'
    end
    
end

class SessionsController < Devise::SessionsController
    
    def get_token
        cookies[:csrf_token] form_authenticity_token
    end

    def create
        puts 'Hello world'
        super

    end

end
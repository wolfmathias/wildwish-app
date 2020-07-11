class SessionsController < Devise::SessionsController

    def create
        puts 'Hello world'
        super

    end

end
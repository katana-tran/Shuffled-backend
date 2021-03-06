class AuthController < ApplicationController
    def index
    end

    def create
      user = User.find_by(username: params[:username])
      if user&.authenticate(params[:password])
        puts "success"
        token = encode_token({id: user.id, username: user.username, deck: user.deck})
        render json: {
          jwt: token
        }
      else
        head :not_found
      end
    end

    
end

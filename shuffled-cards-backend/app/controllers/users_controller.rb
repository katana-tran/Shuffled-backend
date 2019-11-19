class UsersController < ApplicationController


  def index
    @users = User.all
    userRender = @users.map{|user| jawn = {id: user.id, username:user.username, coins:user.coins, decks:user.deck}}
    render json: userRender, except: [:created_at, :updated_at]
   end

   def show
     @user = User.find_by(id: params[:id])
     userRender = {id: @user.id, username: @user.username, coins:@user.coins, deck: @user.deck}
     render json: userRender, except: [:created_at, :updated_at]
   end

   def create
     @user = User.new(
      username: params[:username],
      password: params[:password],
      display_name: params[:display_name],
      avatar_picture: params[:avatar_picture],
      coins: 30,
    )
    if @user.save
      render json: @user, except: [:created_at, :updated_at]

    else
      puts "in error block"
      render json: {message: "There was an error", success: false, data: @user.errors}, status: 406
    end
  end






end

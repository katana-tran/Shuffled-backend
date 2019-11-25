class ChatsController < ApplicationController
    def index
        @chats = Chat.all
        render :json => @chats
    end

    def create 
        Chat.create(game_id:1, title: params["title"])
        @game = Game.find_by(id: 1)
        byebug
        render :json => @game.chats
    end
end

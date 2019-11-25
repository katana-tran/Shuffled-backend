class ChatsController < ApplicationController
    def index
        @chats = Chat.all
        render :json => @chats
    end

    def create 
        @chat = Chat.create(game_id:1, title: params["title"])
        @game = Game.find_by(id: 1)
        serialized_data = ActiveModelSerializers::Adapter::Json.new(
        ChatSerializer.new(@chat)
        ).serializable_hash
        ActionCable.server.broadcast 'chats_channel', serialized_data
        head :ok
    end
end

      
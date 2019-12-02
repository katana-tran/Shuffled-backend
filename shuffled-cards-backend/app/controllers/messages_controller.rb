class MessagesController < ApplicationController
    def index
        @messages = Message.all
        render :json => @messages
    end

    def create
        @user_data = decode_token(params["token"])[0]
        @message = Message.create(chat_id: params["message"]["chat_id"], user_id: @user_data["id"], text: params["text"])
        @chat = Chat.find(params["chat_id"])
        serialized_data = ActiveModelSerializers::Adapter::Json.new(
            MessageSerializer.new(@message)
        ).serializable_hash
        MessagesChannel.broadcast_to @chat, serialized_data
        head :ok
    end
end

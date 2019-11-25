class MessagesController < ApplicationController
    def index
        @messages = Message.all
        render :json => @messages
    end

    def create
        @message = Message.create(chat_id: params["message"]["chat_id"], user_id: 1, text: params["text"])
        @chat = Chat.find(params["chat_id"])
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        MessageSerializer.new(@message)
      ).serializable_hash
      MessagesChannel.broadcast_to @chat, serialized_data
      head :ok

    end
end

class ChatSerializer < ActiveModel::Serializer
  attributes :id, :title, :messages

  def messages 
    self.object.messages.map do |message|
      {
        id: message.id,
        text: message.text,
        user: {
          user_id: message.user_id,
          display_name: message.user.display_name
        },
        created_at: message.created_at
      }
    end 
  end 
end

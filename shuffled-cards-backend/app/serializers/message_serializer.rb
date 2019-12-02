class MessageSerializer < ActiveModel::Serializer
  attributes :id, :text, :chat_id, :user, :created_at
  def user
    {
      user_id: self.object.user.id, 
      display_name: self.object.user.display_name
    }
  end
  
end

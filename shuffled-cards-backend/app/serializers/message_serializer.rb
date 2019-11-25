class MessageSerializer < ActiveModel::Serializer
  attributes :id, :text, :chat_id, :user_id, :created_at
end

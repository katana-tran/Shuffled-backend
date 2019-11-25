class ChatSerializer < ActiveModel::Serializer
  attributes :id, :messages, :title
end

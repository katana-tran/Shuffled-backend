class GameSerializer < ActiveModel::Serializer
  attributes :id, :messages, :player_health_1, :player_health_2, :winner, :player_1, :player_2, :chat
end

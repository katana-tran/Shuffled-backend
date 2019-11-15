class DeckSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :card_id
end

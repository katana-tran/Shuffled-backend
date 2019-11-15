class CardSerializer < ActiveModel::Serializer
  attributes :id, :name, :mana_cost, :health_points, :attack, :card_effect, :card_description, :card_img
end

class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :display_name, :avatar_picture, :coins
end

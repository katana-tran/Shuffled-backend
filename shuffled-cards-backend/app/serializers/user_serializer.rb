class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password_digest, :display_name, :avatar_picture, :coin
end

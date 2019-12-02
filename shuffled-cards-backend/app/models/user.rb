class User < ApplicationRecord
    has_one :deck
    has_many :messages
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false}
end

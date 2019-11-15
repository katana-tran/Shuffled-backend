# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'Faker'

User.destroy_all
Deck.destroy_all
Collection.destroy_all
Card.destroy_all

def make_users_and_decks
    5.times do
        @new_user = User.create(username: "#{Faker::Internet.email}", avatar_picture:"yee" ,coins: 100)
        Deck.create(user_id: @new_user.id)
    end
end

def make_cards
    string_response = RestClient.get("https://omgvamp-hearthstone-v1.p.rapidapi.com/cards", headers={'x-rapidapi-host' => 'omgvamp-hearthstone-v1.p.rapidapi.com', 'x-rapidapi-key' => 'ec39913906mshf4648972b6e832fp1b2936jsn6105500e65f5'})
    response = JSON.parse(response)
    byebug
end

def make_collections
    100.times do 
        Collection.create(deck_id:rand(1..5), card_id: rand(1..50))
    end
    puts "created collections"
end

make_users_and_decks
make_cards
make_collections

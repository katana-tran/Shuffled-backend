# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'Faker'
require 'rest-client'

User.destroy_all
Deck.destroy_all
Collection.destroy_all
Chat.destroy_all
Card.destroy_all
Game.destroy_all
Message.destroy_all

def make_users_and_decks
    5.times do
        @new_user = User.create(username: "#{Faker::Internet.email}", avatar_picture:"yee" ,coins: 100)
        Deck.create(user_id: @new_user.id)
    end
end

def make_cards
    response = RestClient.get("https://omgvamp-hearthstone-v1.p.rapidapi.com/cards", headers={'x-rapidapi-host' => 'omgvamp-hearthstone-v1.p.rapidapi.com', 'x-rapidapi-key' => 'ec39913906mshf4648972b6e832fp1b2936jsn6105500e65f5'})
    response = JSON.parse(response)
    basic_cards = response["Basic"]
    # classic_cards = response["Classic"]
    basic_cards.each do |card|
        Card.create(
            cardId: card["cardId"],
            name: card["name"],
            card_type: card["type"],
            health_points: card["health"],
            mana_cost: card["cost"],
            attack: card["attack"],
            card_effect: card["text"],
            card_description: card["flavor"],
            card_img: card["imgGold"],
            rarity: card["rarity"]
        )
    end
    # byebug
end

def make_collections
    100.times do 
        Collection.create(deck_id:rand(1..5), card_id: rand(1..50))
    end
    puts "created collections"
end

def make_one_game
    Game.create(player_1:1, player_2:2, player_health_1:30, player_health_2:30)
end

def make_one_conversation
    Chat.create(game_id: Game.all.first.id)
end

def make_messages
    5.times do 
        Message.create(text:"#{Faker::Creature::Animal.name}", user_id:1, chat_id:1)
    end
end

make_users_and_decks
make_cards
make_collections
make_one_game
make_one_conversation
make_messages

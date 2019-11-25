Rails.application.routes.draw do
  resources :chats
  resources :users
  resources :messages
  resources :games
  resources :collections
  resources :decks
  resources :cards
  mount ActionCable.server => '/cable'
  resources :auth
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

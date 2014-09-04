FlashcardStatic::Application.routes.draw do
  root 'index#index'
  resources :cards
  resources :users
  resources :decks

  post   'reviews', to: 'reviews#create'
  get    'login',   to: 'user_sessions#new'
  post   'login',   to: 'user_sessions#create'
  delete 'logout',  to: 'user_sessions#destroy'

  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback"
  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider

end

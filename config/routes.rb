FlashcardStatic::Application.routes.draw do
  root 'index#index'
  resources :cards
  resources :users
  resources :user_sessions

  post   'reviews', to: 'reviews#create'
  get    'login',   to: 'user_sessions#new'
  post   'login',   to: 'user_sessions#create'
  delete 'logout',  to: 'user_sessions#destroy'

  get "oauths/oauth"
  get "oauths/callback"
  post "oauth/callback", to: "oauths#callback"
  get "oauth/callback",  to: "oauths#callback"
  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider

end

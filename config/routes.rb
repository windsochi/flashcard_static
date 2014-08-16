FlashcardStatic::Application.routes.draw do
  root 'index#index'
  resources :cards
  resources :user_sessions
  resources :users

  post 'reviews', to: 'reviews#create'
  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout

  Sorcery::Application.routes.draw do
    get "user_sessions/new"
    get "user_sessions/create"
    get "user_sessions/destroy"
  end

end

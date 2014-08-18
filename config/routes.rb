FlashcardStatic::Application.routes.draw do
  root 'index#index'
  resources :cards
  resources :user_sessions
  resources :users

  post 'reviews', to: 'reviews#create'
  get 'login', to: 'user_sessions#new'
  post 'logout', to: 'user_sessions#destroy'
  get "user_sessions/create"

end

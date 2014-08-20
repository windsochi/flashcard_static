FlashcardStatic::Application.routes.draw do
  root 'index#index'
  resources :cards
  resources :users

  post   'reviews', to: 'reviews#create'
  get    'login',   to: 'user_sessions#new'
  post   'login',   to: 'user_sessions#create'
  delete 'logout',  to: 'user_sessions#destroy'

end

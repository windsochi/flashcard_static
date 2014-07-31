FlashcardStatic::Application.routes.draw do
  root 'index#index'
  resources :cards
  post 'reviews', to: 'reviews#create'  
end

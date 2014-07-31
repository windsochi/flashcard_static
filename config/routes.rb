FlashcardStatic::Application.routes.draw do
  root 'index#index'
  resources :cards
  put 'reviews', to: 'reviews#create_card'  
end

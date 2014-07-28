FlashcardStatic::Application.routes.draw do
  root 'index#index'
  resources :cards
  resources :check
end

FlashcardStatic::Application.routes.draw do
  root 'index#index'
  resources :cards
  put 'check', to: 'check#index'  
end

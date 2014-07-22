FlashcardStatic::Application.routes.draw do
root 'index#index'

resources :cards
end

FlashcardStatic::Application.routes.draw do
  root 'index#index'
  resources :cards
  get '/:search', to: 'check#index', as: 'check'
end

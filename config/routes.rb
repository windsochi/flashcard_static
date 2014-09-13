FlashcardStatic::Application.routes.draw do
  root 'index#index'

  resources :users, except: [:show, :destroy, :index] do
    member do
      put 'set_current_deck'
    end
  end

  shallow do
    resources :decks do
      resources :cards
    end
  end

  post   'review', to: 'index#review'
  get    'login',   to: 'user_sessions#new'
  post   'login',   to: 'user_sessions#create'
  delete 'logout',  to: 'user_sessions#destroy'

  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback"
  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider

end

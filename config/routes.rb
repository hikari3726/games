Rails.application.routes.draw do
  
  get 'sessions/new'
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#index'
  resources :users do
    resources :favorites, only: [:index]
  end
  resources :reviews, only: [:index]
  resources :ranks, only: [:index]
  resources :games do
    resources :reviews
    collection do
      get :rank
      get :search
    end
  end
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'
  
end

Rails.application.routes.draw do
  devise_for :users
  
  resources :users do 
    resources :relationships, only: [:create]
  end
  
  resources :relationships, only: [:destroy]

  root 'feed#index'

end

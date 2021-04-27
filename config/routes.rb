Rails.application.routes.draw do
  resources :posts do
    resources :likes, only: %i[create destroy]
  end


  devise_for :users
  
  resources :users do 
    resources :relationships, only: [:create]
  end
  
  resources :relationships, only: [:destroy]

  root 'feed#index'
  get 'profile', to: 'profile#index'
  get 'profile/:id', to: 'profile#show', as: 'profile_user'

end

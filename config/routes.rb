Rails.application.routes.draw do
  resources :messages
  resources :rooms
  resources :posts do
    resources :likes, only: %i[create destroy]
  end

  devise_for :users, :controllers => { :registrations => :registrations }
  
  resources :users do 
    resources :relationships, only: [:create]
  end
  
  resources :relationships, only: [:destroy]

  root 'feed#index'
  get 'profile', to: 'profile#index'
  get 'profile/:id', to: 'profile#show', as: 'profile_user'
  post 'comments/:post_id', to: 'comments#create', as: 'new_comment'
  post 'comments/:post_id/:id', to: 'comments#reply', as: 'new_reply'
  
end

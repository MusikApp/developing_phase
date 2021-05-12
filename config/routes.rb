Rails.application.routes.draw do
  resources :demos
  resources :rooms do
    resources :messages
  end
  
  resources :posts do
    resources :likes, only: %i[create destroy]
  end

  resources :likes, only: %i[index]

  devise_for :users, :controllers => { :registrations => :registrations }
  
  # root 'explorer#index'
  get 'feed/index'
  get 'statistics/index'
  root 'feed#index'
  get 'explorer/index'
  get 'profile', to: 'profile#index'
  get 'profile/:id', to: 'profile#show', as: 'profile_user'
  post 'comments/:post_id', to: 'comments#create', as: 'new_comment'
  post 'comments/:post_id/:id', to: 'comments#reply', as: 'new_reply'
  post 'profile/:id', to: 'relationships#create', as: 'follow'
  delete 'profile/:id', to: 'relationships#destroy', as: 'unfollow'
  
end

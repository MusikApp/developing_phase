Rails.application.routes.draw do
<<<<<<< HEAD
  resources :demos
=======
  resources :rooms do
    resources :messages
  end
  
>>>>>>> dcf63b76e7fa04c49ced00a70e05f6662b1c040b
  resources :posts do
    resources :likes, only: %i[create destroy]
  end

  devise_for :users, :controllers => { :registrations => :registrations }
  
  root 'feed#index'
  get 'explorer/index'
  get 'profile', to: 'profile#index'
  get 'profile/:id', to: 'profile#show', as: 'profile_user'
  post 'comments/:post_id', to: 'comments#create', as: 'new_comment'
  post 'comments/:post_id/:id', to: 'comments#reply', as: 'new_reply'
  post 'profile/:id', to: 'relationships#create', as: 'follow'
  delete 'profile/:id', to: 'relationships#destroy', as: 'unfollow'
  
end

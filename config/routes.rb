Rails.application.routes.draw do
  devise_for :users
  
  resources :users do 
    resources :relationships, only: %i[ create ]
  end

  delete 'relationships/destroy'

  root 'feed#index'

end

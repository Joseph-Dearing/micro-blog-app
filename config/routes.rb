Rails.application.routes.draw do
  get 'comments/new'
  get 'users/index'
  get 'users/show'
  get 'comments/edit'
  root 'blogs#index'
  
  devise_for :users
  get '/users/:id', to: 'users#show'


  resources :blogs do
    resources :comments
  end
    
end
  

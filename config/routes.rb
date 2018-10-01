Rails.application.routes.draw do
  root 'blogs#index'
  
  devise_for :users
  
 
    resources :blogs
 
    devise_scope :user do
      get "/signout" => "devise/sessions#destroy"
      unauthenticated do
        root :to => 'devise/sessions#new'
      end
      authenticated do
        root :to => 'blogs#index'
      end
    end
    
  end
  

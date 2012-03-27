Lopr::Application.routes.draw do

  ## Authentication
  devise_scope :user do
    match '/user/confirmation' => 'confirmations#update', :via => :put, :as => :update_user_confirmation
  end
  devise_for :users, :controllers => { 
    :confirmations => "confirmations",
    :registrations => "registrations"
  }
  
  namespace :admin do
    resources :speakers
    resources :events
    resources :products
    resources :sponsors
    resources :pages
    root :to => 'application#dashboard'
  end
  
  resources :events
  resources :speakers
  resources :products do
    get :buy, :on => :member
    get :order, :on => :collection
  end
  post 'products/callback' => "products#callback"
  get 'welcome' => 'pages#welcome', :as => :welcome
  get 'thanks' => 'pages#thanks', :as => :thanks
  
  authenticated :user do
    root :to => "pages#start"
  end
  root :to => 'pages#index'
  
end

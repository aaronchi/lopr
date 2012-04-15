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
    resources :speakers do
      put :sort, :on => :collection
    end
    resources :events
    resources :products
    resources :bonuses do
      put :sort, :on => :collection
    end
    resources :sponsors do
      put :sort, :on => :collection
    end
    resources :pages do
      put :sort, :on => :collection
    end
    resources :images
    root :to => 'application#dashboard'
  end
  post 'tinymce_assets' => 'admin/images#upload'
  
  resources :events, :path => 'now', :only => :index
  resources :speakers, :path => '', :only => :show
  resources :products, :only => :show do 
    get :buy, :on => :member
    get :order, :on => :collection
  end
  resources :bonuses, :only => :show
  post 'products/callback' => "products#callback"
  get 'welcome' => 'pages#welcome', :as => :welcome
  get 'thanks' => 'pages#thanks', :as => :thanks
  
  authenticated :user do
    root :to => "pages#start"
  end
  match 'pages/:id' => "pages#show", :as => :page
  root :to => 'pages#index'
  
end

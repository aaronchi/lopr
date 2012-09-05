Lopr::Application.routes.draw do

  ## Authentication
  devise_scope :user do
    match '/user/confirmation' => 'confirmations#update', :via => :put, :as => :update_user_confirmation
    match '/user/confirmation/callback' => 'confirmations#callback'
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
    resources :products do
      put :sort, :on => :collection
    end
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
    resources :orders do
      get :autocomplete_user_email, :on => :collection
    end
    root :to => 'application#dashboard'
  end
  post 'tinymce_assets' => 'admin/images#upload'
  
  resources :events, :path => 'now', :only => :index
  
  resources :products, :only => :show do 
    get :buy, :on => :member
    resources :downloads, :only => :show
  end
  resources :bonuses, :only => :show
  resources :sponsors, :only => :index
  post 'products/callback' => "products#callback"
  get 'orders/notify' => "orders#notify"
  get 'welcome' => 'pages#welcome', :as => :welcome
  get 'thanks' => 'pages#thanks', :as => :thanks
  match 'replay:id' => 'events#show', :as => :event
  resources :speakers, :path => '', :only => :show
  authenticated :user do
    root :to => "pages#start"
  end
  match 'pages/:id' => "pages#show", :as => :page
  root :to => 'pages#index'
  
end

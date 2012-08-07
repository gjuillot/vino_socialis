VinoSocialis::Application.routes.draw do

  resources :countries
  resources :regions
  resources :areas
  
  devise_for :users
  resources :users

  root :to => "home#index"
  match '/discover', :to => "home#discover"
  match '/track', :to => "home#track"
  match '/share', :to => "home#share"
  match '/about', :to => "home#about"
  
end

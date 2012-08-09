VinoSocialis::Application.routes.draw do

  resources :estates do
    member do
      post 'validate'
      post 'unvalidate'
    end
    collection do
      get 'search'
    end
  end

  resources :wines do
    member do
      post 'validate'
      post 'unvalidate'
    end
    collection do
      get 'search'
    end
  end

  resources :wine_colors

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

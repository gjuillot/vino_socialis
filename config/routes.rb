VinoSocialis::Application.routes.draw do
  
  scope "/:locale" do
    resources :tastings

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
        post 'taste'
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

    match '/discover', :to => "home#discover"
    match '/track', :to => "home#track"
    match '/share', :to => "home#share"
    match '/about', :to => "home#about"
    match '/wines_and_estates', :to => "wines_and_estates#index"
  end
  
  match "/:locale" => "home#discover"
  root :to => "home#index"
  
end

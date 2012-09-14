VinoSocialis::Application.routes.draw do

  scope "/:locale" do
    
    resources :wine_racks do
      member do
        get 'place'
        get 'apply_place'
      end
    end

    resources :consumptions
    
    resources :pairings do
      collection do
        get 'search'
      end
    end
    
    resources :bottles do
      member do
        get 'consume'
        get 'place'
        get 'unplace'
      end
      collection do
        get 'not_placed'
      end
    end
      
    resources :tastings
    
    resources :wine_recommandations do
      collection do
        get 'most'
      end
    end

    resources :estates do
      member do
        post 'validate'
        post 'unvalidate'
        get 'replace'
      end
      collection do
        get 'search'
      end
    end

    resources :wines do
      member do
        post 'validate'
        post 'unvalidate'
        get 'taste'
        get 'encave'
        get 'recommand'
        get 'unrecommand'
        get 'replace'
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
    
    resources :conversations do
      collection do
        get 'admins'
        get 'bug'
      end
    end
    
    resources :glossaries
    
    resources :moderations do
      collection do
        get 'sheets'
      end
    end
    
    root :to => "home#index"

    match '/why', :to => "home#why"
    match '/about', :to => "home#about"
    match '/wines_and_estates', :to => "wines_and_estates#index"
  end

  root :to => redirect('/fr/')
  
  match '/areas/for_region_id/:region_id' => 'areas#for_region_id'
  
end

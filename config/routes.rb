VinoSocialis::Application.routes.draw do

  scope "/(:locale)" do
    
    resources :wine_racks do
      member do
        get 'place'
        get 'apply_place'
        post 'empty'
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
        get 'add_label'
      end
    end

    resources :wine_colors

    resources :countries
    resources :regions
    resources :areas
    
    resources :grape_varieties do
      member do
        post 'validate'
        get 'replace'
        post 'do_replace'
      end
    end
  
    devise_for :users
    resources :users do
      member do
        get 'stat'
        get 'dashboard'
        get 'become'
      end
    end
    
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
        get 'labels'
      end
    end
    
    resources :wines_and_estates do
      collection do
        get 'search'
      end
    end
    
    resources :labels do
      member do
        post 'validate'
      end
    end
    
    root :to => "home#index"

    match '/why', :to => "home#why"
    match '/about', :to => "home#about"
    match '/discover', :to => "home#discover"
    match '/track', :to => "home#track"
    match '/share', :to => "home#share"
  end

  match '', :to => redirect { |p, r| p[:locale] ? "/#{p[:locale]}/" : '/fr/' }
  
  match '/areas/for_region_id/:region_id' => 'areas#for_region_id'
  
end

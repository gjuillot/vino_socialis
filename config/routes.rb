VinoSocialis::Application.routes.draw do

  scope "/(:locale)", :locale => /fr|en/ do
    
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
    
    resources :estates do
      member do
        post 'validate'
        post 'unvalidate'
        get 'replace'
        post 'comment'
      end
    end

    resources :wines do
      member do
        post 'validate'
        post 'unvalidate'
        get 'taste'
        get 'tastings'
        get 'encave'
        get 'replace'
        get 'add_label'
        post 'comment'
      end
      collection do
        get 'recommanded'
      end
    end

    resources :wine_colors

    resources :countries do
      member do
        post 'comment'
      end
    end
    resources :regions do
      member do
        post 'comment'
      end
    end
    resources :areas do
      member do
        post 'comment'
      end
    end
    resources :superficies
    resources :volumes
    resources :color_volumes
    resources :area_color_grapes
    
    resources :grape_varieties do
      member do
        post 'validate'
        get 'replace'
        post 'do_replace'
      end
    end
  
    devise_for :users
    resources :users do
      collection do
        get 'search'
      end
      member do
        get 'stat'
        get 'dashboard'
        get 'become'
        get 'tags'
        get 'tastings'
        get 'books'
        get 'follow'
        get 'unfollow'
        get 'friends'
      end
    end
    
    resources :conversations do
      collection do
        get 'admins'
        get 'bug'
        delete 'destroy_multiple'
      end
    end
    
    resources :glossaries
    
    resources :moderations do
      collection do
        get 'sheets'
        get 'labels'
        get 'books'
        get 'clean'
        get 'proposals'
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
    
    resources :vintages do
      collection do
        post 'rate'
      end
    end
    
    resources :proposals do
      member do
        post 'close'
      end
    end
    
    resources :books do
      member do
        post 'validate'
        get 'own'
        post 'comment'
      end
    end
    resources :book_ratings
    
    root :to => "home#index"

    match '/why', :to => "home#why"
    match '/about', :to => "home#about"
    match '/discover', :to => "home#discover"
    match '/temperature', :to => "home#temperature"
    match '/track', :to => "home#track"
    match '/share', :to => "home#share"
    match '/newcomer', :to => "home#newcomer"
    match '/sitemap', :to => "home#sitemap"
  end

  match '', :to => redirect { |p, r| p[:locale] ? "/#{p[:locale]}/" : '/fr/' }
  
  match '/areas/for_region_id/:region_id' => 'areas#for_region_id'
  
end

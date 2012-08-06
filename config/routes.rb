VinoSocialis::Application.routes.draw do
  root :to => "home#index"
  match '/about', :to => "home#help"
end

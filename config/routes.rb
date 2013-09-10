CodetvNginx::Application.routes.draw do
  resources :entries

  root :to => "home#index"

  ### Begin RailsThemes basic generated routes ###

  # Routes to RailsThemes Theme Example markup:
  namespace :railsthemes do
    match '/' => 'railsthemes#index', :via => [:get]
    match '/:action', :controller => :railsthemes, :via => [:get, :post]
  end

  # This is magical routing for errors (instead of using the static markup in
  # public/*.html)
  match '/403' => 'railsthemes_errors#403_forbidden', :via => [:get]
  match '/404' => 'railsthemes_errors#404_not_found', :via => [:get]
  match '/500' => 'railsthemes_errors#500_internal_server_error', :via => [:get]

  ### End RailsThemes basic generated routes ###
end

ActionController::Routing::Routes.draw do |map|
  map.logout '/admin/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/admin/login', :controller => 'sessions', :action => 'new'
  map.admin '/admin', :controller => 'games', :action => 'new'
  #map.register '/register', :controller => 'users', :action => 'create'
  #map.signup '/signup', :controller => 'users', :action => 'new'
  #map.resources :users

  map.resource :session

  map.resources :games, :only => :show
  map.resources :games, :path_prefix => :admin, :except => :show

  map.home '/', :controller => 'home'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end

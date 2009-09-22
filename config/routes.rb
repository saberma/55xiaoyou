ActionController::Routing::Routes.draw do |map|
  map.logout '/member/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/member/login', :controller => 'sessions', :action => 'new'
  map.member '/member', :controller => 'games', :action => 'new'
  #map.register '/register', :controller => 'users', :action => 'create'
  #map.signup '/signup', :controller => 'users', :action => 'new'
  #map.resources :users

  map.resource :session, :path_prefix => :member

  map.resources :games, :path_prefix => :member, :except => :show
  map.show_game '/game/:id', :controller => 'games', :action =>'show'
  #获取总数
  map.games_max '/games/max.:format', :controller => 'games', :action =>'max'

  map.home '/', :controller => 'home'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end

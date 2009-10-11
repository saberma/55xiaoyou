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

  #site
  map.aboutus '/aboutus', :controller => 'site', :action => 'aboutus'
  map.contactus '/contactus', :controller => 'site', :action => 'contactus'
  map.partner '/partner', :controller => 'site', :action => 'partner'
  map.disclaimer '/disclaimer', :controller => 'site', :action => 'disclaimer'
  map.sitemap '/sitemap', :controller => 'site', :action => 'map'


  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end

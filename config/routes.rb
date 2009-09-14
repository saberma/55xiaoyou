ActionController::Routing::Routes.draw do |map|
  map.resources :games

  map.home '/', :controller => 'home'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end

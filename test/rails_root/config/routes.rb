ActionController::Routing::Routes.draw do |map|
  map.resources :users
  
  map.namespace :admin do |admin|
    admin.resources :users
  end

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end

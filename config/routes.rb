ActionController::Routing::Routes.draw do |map|
  map.resources :comments

  map.resources :posts

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => "posts"

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end

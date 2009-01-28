ActionController::Routing::Routes.draw do |map|
  map.resources :users

  map.resources :comments

  map.resources :posts,
    :member => { :add_comment => :post }  

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => "posts"
  
  # Authlogic Session
  map.resource :user_session
  map.root :controller => "user_sessions", :action => "new"
  
  # Authlogic User Controller
  map.resource :account, :controller => "users"
  map.resources :users
  

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end

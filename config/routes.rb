ActionController::Routing::Routes.draw do |map|
  map.resources :users

  map.resources :comments

  map.resources :posts,
    :member => { :add_comment => :post }  

  # Kept only to have 'root page detection'
  map.root :controller => "life", :action => 'show'
  map.blog '/blog', :controller => "posts"
  
  # Authlogic Session
  map.resource :user_session
  map.root :controller => "user_sessions", :action => "new"
  
  # Authlogic User Controller
  map.resource :account, :controller => "users"
  map.resources :users
  

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end

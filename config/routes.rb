ActionController::Routing::Routes.draw do |map|

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"
  map.resources :sessions, :only => [:new, :create, :destroy]
  map.resources :users
  map.resources :promises
  map.resources :groups
  map.root :controller => 'pages', :action=>'home'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.show '/show', :controller => 'users', :action => 'show'
  map.signin  '/signin',  :controller => 'sessions', :action => 'new'
  map.signout '/signout', :controller => 'sessions', :action => 'destroy'
  map.promise '/promise', :controller => 'pages', :action => 'promise'
  map.pload '/pload', :controller => 'pages', :action =>'load'
  map.ptips '/ptips', :controller => 'pages', :action =>'tips'
  map.pedit '/pedit', :controller => 'pages', :action =>'edit'
  map.pupdate '/pupdate', :controller => 'pages', :action =>'update'
  map.pdestory '/pdestory', :controller => 'pages', :action =>'destory'
  map.gnew '/gnew', :controller => 'groups', :action =>'new'
  map.gshow '/gshow', :controller => 'groups', :action => 'show'
  map.gindex '/gindex', :controller => 'groups', :action =>'index'

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end

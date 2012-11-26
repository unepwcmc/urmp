Urmp::Application.routes.draw do
  get "factsheets/index"

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  get "static/about"
  get "criteria/show"

  resources :principles, :only => [:index]
  resources :criteria, :only => [:show]
  resources :resources, :only => [:index, :show]
  resources :factsheets, :only => [:index, :show]

  devise_for :users

  root :to => "static_pages#home"
  match "monitoring" => "static_pages#monitoring", :as => "monitoring"
  match "safeguards" => "static_pages#safeguards", :as => "safeguards"
  match "assesments" => "static_pages#assesments", :as => "assesments"
  match "faq" => "static_pages#faq", :as => "faq"
  match "search" => "resources_search#show", :as => "search"
  match "search_results" => "resources_search#results", :as => "search_results"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end

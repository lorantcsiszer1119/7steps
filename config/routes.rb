Jobs::Application.routes.draw do
  resources :openings


  #steps links
  get 'one' => 'static#step1'
  get 'two' => 'static#step2'
  get 'three' => 'static#step3'
  get 'four' => 'static#step4'
  get 'five' => 'static#step5'
  get 'six' => 'static#step6'
  get 'seven' => 'static#step7'
  get 'eight' => 'static#step8'
  get 'nine' => 'static#step9'
  get 'ten' => 'static#step10'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
authenticated :user do
  root :to => "openings#index", as: "dashboard"
end

unauthenticated :user do
  devise_scope :user do 
    get "/" => "users#new", as: "welcome"
  end
end

  devise_for :users
  resources :users

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

Rails.application.routes.draw do
  get "/" => "products#index",as: :root

  get "/products/new" => "products#new", as: :new_products
  post "/products" => "products#create", as: :products

  get "/products/delete" => "products#destroy", as: :delete_products
  delete "/products/delete" => "products#destroy"

  get "/products/:id" => "products#show", as: :product
  get "/products" => "products#index" # we don'have to use set it because it has same URL as post
  get "/products/:id/edit" => "products#edit", as: :edit_product
  patch "/products/:id" => "products#update"
  delete "/products/:id" => "products#destroy"

  resources :products do
    resources :reviews, only: [:create, :destroy]

  end


  resources :users, only: [:create, :new]

  resources :sessions, only: [:new, :create, :destroy] do
    delete :destroy, on: :collection
  end






#   resources :products, only: [] do
#     resources :reviews, only: [:create, :destroy]
# end








  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #  root 'welcome#index'

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

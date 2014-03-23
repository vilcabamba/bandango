require "sidekiq/web"
require "admin_constraint"

Bandango::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  get 'logout', to: 'sessions#destroy'
  resources :sessions

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
  namespace :api do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
    resources :stats, only: [:index]
    resources :clientes
    resources :users
    resources :ventas
    resources :compras
    resources :comprobantes
    resources :sustento_comprobantes
    resources :concepto_retencion_fuentes
    resources :items
    resources :categories
    resources :emisores
    resources :cierres_caja
    resources :current_user do
      collection do
        post "/", to: "current_user#update"
      end
    end
  end

  # sidekiq:
  mount Sidekiq::Web, at: "/sidekiq_web", :constraints => AdminConstraint.new

end
# put next lines before end statement: (route unroutable paths)
# match '*a', :to => 'application#routing_error'

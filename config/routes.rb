require "sidekiq/web"
require "admin_constraint"

Bandango::Application.routes.draw do
  root "home#index"

  get "healthcheck", to: "home#healthcheck"

  get "logout", to: "sessions#destroy"
  resources :sessions

  namespace :api do
    resources :clientes
    resources :users
    resources :ventas
    resources :compras
    resources :items
    resources :categories
    resources :emisores
    resources :cierres_caja

    resources :stats, only: :index

    resources :sustento_comprobantes, only: :index
    resources :concepto_retencion_fuentes, only: :index
    resources :comprobantes, only: :index
    resources :cash_denominations, only: :index

    resources :current_user do
      collection do
        post "/", to: "current_user#update"
      end
    end
  end

  # sidekiq:
  mount Sidekiq::Web, at: "/_sidekiq", :constraints => AdminConstraint.new
end

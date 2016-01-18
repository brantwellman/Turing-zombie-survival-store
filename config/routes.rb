Rails.application.routes.draw do
  root "home#welcome"

  namespace :admin do
    get "/dashboard", to: "users#index"
    resources :items, only: [:new, :create]
  end

  resources :users, only: [:new, :create, :edit, :update]
  resources :orders, only: [:index, :create, :show]

  resources :items, only: [:index, :show]
  resources :categories, only: [:show], param: :title
  resources :duffel_items, only: [:create, :update]

  get "/dashboard", to: "users#show"

  get "/duffel", to: "duffel_items#index"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end

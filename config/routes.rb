Rails.application.routes.draw do
  root "home#welcome"
  resources :users, only: [:new, :create]
  resources :items, only: [:index]
  resources :duffel_items, only: [:create]
  resources :categories, only: [:show], param: :title

  get "/dashboard", to: "users#show"
  get "/duffel", to: "duffel_items#index"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end

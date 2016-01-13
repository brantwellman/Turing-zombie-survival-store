Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :items, only: [:index]
  resources :duffel_items, only: [:create]

  get "/", to: "home#welcome"
  get "/dashboard", to: "users#show"
  get "/categories/:title", to: "categories#show"
  # get "/duffel"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end

Rails.application.routes.draw do
  resources :items, only: [:index]
  # get "/categories/:title", to: "categories#show"
  resources :categories, only: [:show], param: :title
  resources :duffel_items, only: [:create]
  get "/duffel", to: "duffel_items#index"
end

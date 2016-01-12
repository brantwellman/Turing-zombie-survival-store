Rails.application.routes.draw do
  resources :items, only: [:index]
  get "/categories/:title", to: "categories#show"
  resources :duffel_items, only: [:create]
end

Rails.application.routes.draw do
  root "static_pages#home"
  get "phone", to: "static_pages#phone"
  get "tablet", to: "static_pages#tablet"
  get "laptop", to: "static_pages#laptop"
  get "accessory", to: "static_pages#accessory"
  get "sale", to: "static_pages#sale"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users
end

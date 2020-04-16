Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :candidates
  resources :companies
  resources :positions
  resources :applications, only: [:show, :new, :create, :index, :update]

  root "sessions#index"

  get "/sessions/login", to: "sessions#new", as: "login"
  post "/sessions", to: "sessions#create", as: "sessions"

  delete "/sessions", to: "sessions#destroy"
end

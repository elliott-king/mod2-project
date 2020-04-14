Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :candidates
  resources :companies
  resources :positions
  resources :applications, except: [:index]
end

Rails.application.routes.draw do
  root "home#index"

  get  "/register", to: "registrations#new", as: :register
  post "/register", to: "registrations#create"
  get  "/login", to: "sessions#new", as: :login
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: :logout

  get "/dashboard", to: "dashboard#index", as: :dashboard
  resources :challenges, only: %i[index show] do
    resources :attempts, only: %i[create]
  end

  namespace :admin do
    root "dashboard#index"
    get "dashboard", to: "dashboard#index"
    resources :challenges
    resources :users, only: %i[index show]
    resources :attempts, only: %i[index]
    get "reports", to: "reports#index"
  end
end

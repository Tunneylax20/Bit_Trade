BitTrade::Application.routes.draw do

  resources :users do
    resources :accounts 
  end

  get "/login", to: "sessions#new"
  post "/session", to: "sessions#create"
  delete "/session", to: "sessions#destroy"

  root "welcome#index"


end

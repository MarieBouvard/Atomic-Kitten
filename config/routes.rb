Rails.application.routes.draw do
  resources :carts
  devise_for :users
  root to: "home#index"
end

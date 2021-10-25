Rails.application.routes.draw do

  devise_for :users
  resources :items
  resources :order_items
  resources :cart_items, only: [:create, :update, :destroy]
  resources :carts, except: [:index, :new, :edit]



  root to: 'items#index'
end

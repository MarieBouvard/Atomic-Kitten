Rails.application.routes.draw do

  devise_for :users
  resources :items
  resources :order_items
  resources :cart_items, only: [:create, :update, :destroy]
  resources :carts, except: [:index, :new, :edit]


  root to: 'items#index'

  scope 'checkout' do  
    post 'create', to: 'checkout#create', as: 'checkout_create'
    post 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    post 'success', to: 'checkout#success', as: 'checkout_success'
  end
end

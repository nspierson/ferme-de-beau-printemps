Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :products, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :categories, only: [:show]
  resource  :cart, only: [:show] do
    put 'add/:product_id', to: 'carts#add', as: :add_to
    put 'remove/:product_id', to: 'carts#remove', as: :remove_from
    put 'remove_one/:product_id', to: 'carts#removeone', as: :remove_one
  end

  resources :orders, only: [:index, :show, :create] do
    resources :payments, only: [:new]
  end

  get 'checkout/:order_id', to: 'pages#checkout', as: :checkout
  get 'delivery_zone', to: 'pages#delivery_zone', as: :delivery

  namespace :admin do
    root to: 'pages#home'
    resources :products, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    resources :categories, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  end
end

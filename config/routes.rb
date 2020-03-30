Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root to: 'pages#home'
  mount StripeEvent::Engine, at: '/stripe-webhooks'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :products, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    get 'productod', to: 'products#product_of_the_day'
  end
  resources :categories, only: [:create, :new, :index, :show]
  resource  :cart, only: [:show] do
    put 'add/:product_id', to: 'carts#add', as: :add_to
    put 'add_one/:product_id', to: 'carts#addone', as: :add_one_to
    put 'remove/:product_id', to: 'carts#remove', as: :remove_from
    put 'remove_one/:product_id', to: 'carts#removeone', as: :remove_one
  end
  resources :recipes, only: [:new, :create, :edit, :update] do
    get 'displayrecip', to: 'orders#display_recip'
  end


  resources :orders, only: [:index, :show, :create] do
    resources :payments, only: [:new]
  end

  resources :contacts, only: [:new, :update, :edit, :show], as: :contact

  get 'checkout/:order_id', to: 'pages#checkout', as: :checkout
  get 'delivery_zone', to: 'pages#delivery_zone', as: :delivery
  get 'contact', to: 'pages#contact', as: :contact_info

  namespace :admin do
    root to: 'pages#home'
    resources :products, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    resources :categories, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  end


end

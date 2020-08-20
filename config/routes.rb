Rails.application.routes.draw do


  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    passwords: 'customers/passwords',
    registrations: 'customers/registrations'
  }

  scope module: :end_user do
    root 'homes#top'

    get 'homes/about' => 'homes#about'
    resource :customers, only: [:show, :edit, :update]

    get 'customers/exit' => 'customers#exit_page'
    patch 'customers/exit' => 'customers#exit'
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :create, :destroy]
    patch 'cart_items/:id' => 'end_user/cart_items#quantity'
    delete 'cart_items/destroy_all' => 'end_user/cart_items#destroy_all'
    resources :shipping_addresses, only: [:index, :create, :edit, :update, :destroy]
    get 'orders/thanks' => 'orders#thanks'
    get 'orders/history' => 'orders#history_index'
    get 'orders/history/:id' => 'orders#history_show'
    resources :orders, only: [:new, :create, :show]

  end

  namespace :admin do
    get 'homes/top' => 'homes#top'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    resources :orders, only: [:index, :show]
    resources :genres, only: [:index, :edit, :create, :update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

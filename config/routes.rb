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
    get 'homes/gorilla' => 'homes#gorilla'
    get 'search' => 'searches#search'
    resource :customers, only: [:show, :edit, :update]

    get 'customers/exit' => 'customers#exit_page'
    patch 'customers/exit' => 'customers#exit'
    resources :items, only: [:index, :show]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :destroy]
    post 'cart_items/:id' => 'cart_items#create'
    patch 'cart_items/:id' => 'cart_items#quantity'
    resources :shipping_addresses, only: [:index, :create, :edit, :update, :destroy]
    get 'orders/thanks' => 'orders#thanks'
    get 'orders/history' => 'orders#history_index'
    get 'orders/history/:id' => 'orders#history_show', as: 'history'
    resources :orders, only: [:new, :create]
    post 'orders/confirm' => 'orders#confirm'
    get 'genres/:id' => 'genres#show', as: 'genre_items'
    resources :questionnaires, only: [:index,:new,:edit,:create,:update,:destroy]


  end

  namespace :admin do
    get 'homes/top' => 'homes#top'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :items, only: [:new, :create, :index, :show, :edit, :update, :destroy]
    resources :orders, only: [:index, :show]
    patch 'order_status/:id' => 'orders#update_status', as:"order_status"
    patch 'production_status/:id' => 'orders#update_production', as:"production_status"
    resources :genres, only: [:index, :edit, :create, :update]
    get "categories" => "categories#index",as:"category"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

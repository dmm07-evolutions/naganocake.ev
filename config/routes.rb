Rails.application.routes.draw do
  get 'orders/thanks'
  get 'orders/histry_index'
  get 'orders/histry_show'
  root 'homes#top'
  devise_for :admins
  devise_for :customers
  get "homes/about" => "homes#about"
  resources :orders, only:[:new, :create, :index]
  # itemsのルーティング
  resources :items, only: [:index, :show]
  # cart_itemsのルーティング
  resources :cart_items, only: [:index, :create, :destroy]
  resources :ordered_item,only:[:index, :create, :edit, :show]
  patch "cart_items/:id" => "cart_items#quantity"
  delete "cart_items/destroy_all" => "cart_items#destroy_all"


  resources :shipping_addresses, only: [:index, :edit]
  resources :genres, only: [:index, :edit]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

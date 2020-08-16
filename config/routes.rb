Rails.application.routes.draw do
  root 'homes#top'
  devise_for :admins
  devise_for :customers
  get "homes/about" => "homes#about"
  # itemsのルーティング
  resources :items, only: [:index, :show]
  # cart_itemsのルーティング
  resources :cart_items, only: [:index, :create, :destroy]
  patch "cart_items/:id" => "cart_items#quantity"
  delete "cart_items/destroy_all" => "cart_items#destroy_all"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  get 'genres/index'
  get 'genres/edit'
  root 'homes#top'
  devise_for :admins
  devise_for :customers
  get "homes/about" => "homes#about"
  resources :shipping_addresses, only: [:index, :edit]
  resources :genres, only: [:index, :edit]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

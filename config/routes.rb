Rails.application.routes.draw do
  root 'homes#top'
  devise_for :admins
  devise_for :customers
  get "homes/about" => "homes#about"
  # itemsのルーティング
  resources :items, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

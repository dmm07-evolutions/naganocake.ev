Rails.application.routes.draw do
  root 'home#top'
  devise_for :admins
  devise_for :customers
  get "homes/about" => "homes#about"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

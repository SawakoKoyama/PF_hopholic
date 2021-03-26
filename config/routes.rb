Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get "about" => "homes#about" , as: "about"
  resources :users
  resources :breweries
  resources :relationships, only: [:create, :destroy]
  resource :favorites, only: [:create, :destroy]
end

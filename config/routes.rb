Rails.application.routes.draw do
  resources :discs
  resources :cards, :variants, :courses
  resources :coursekeys, only: [:create]
  resources :disckeys, only: [:create, :destroy]
  resources :discs, only: [:create]
  devise_for :users
  root 'home#index'
  get 'home/profile'
  get 'home/map'
  get 'home/discbag'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

Rails.application.routes.draw do
  resources :cards, :variants, :courses
  resources :coursekeys, only: [:create]
  resources :discs, only: [:create]
  devise_for :users
  root 'home#index'
  get 'home/profile'
  get 'home/map'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

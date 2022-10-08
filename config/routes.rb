Rails.application.routes.draw do
  resources :discs
  resources :cards, :variants, :courses
  resources :coursekeys, only: [:create]
  resources :disckeys, only: [:create, :destroy]

  devise_for :users

  root 'home#index'
  get 'home/profile'
  get 'home/map'
  get 'home/discbag'
  get 'dsearch', to: 'discs#search'

end

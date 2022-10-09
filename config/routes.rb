Rails.application.routes.draw do
  resources :discs, :cards, :variants, :courses, :coursekeys, :disckeys
  devise_for :users

  root 'home#index'
  get 'home/profile'
  get 'home/map'
  get 'home/discbag'

end

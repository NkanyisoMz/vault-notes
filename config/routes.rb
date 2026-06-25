Rails.application.routes.draw do
  get 'home/index'

  get "admin", to: "admin#index"

  devise_for :users

  resources :notes

  root "home#index"
end

Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  resources :reservations
  resources :schedules
  resources :movies
  resources :rooms
  resources :cinemas

  root to: 'home#index'
end

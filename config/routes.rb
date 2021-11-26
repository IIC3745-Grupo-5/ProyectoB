Rails.application.routes.draw do
  devise_for :users
  resources :reservations
  resources :schedules
  resources :movies
  resources :rooms
  resources :cinemas

  root 'cinemas#index'
end

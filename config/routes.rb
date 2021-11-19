Rails.application.routes.draw do
  resources :reservations
  resources :schedules
  resources :movies
  resources :rooms
  resources :cinemas

  root 'cinemas#index'
end

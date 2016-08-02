Rails.application.routes.draw do
  root to: 'home#index'
  resources :events
  resources :users
end

Rails.application.routes.draw do
  root to: 'home#index'
  resources :bounties
  resources :events
  resources :users
end

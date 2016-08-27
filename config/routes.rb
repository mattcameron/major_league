Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :events, except: [:new, :destroy]

  namespace :admin do
    resources :users
    resources :events
  end
end

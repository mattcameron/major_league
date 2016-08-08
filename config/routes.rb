Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :events, only: :show

  namespace :admin do
    resources :users
    resources :events
  end
end

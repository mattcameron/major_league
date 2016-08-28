Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'registrations'}
  root to: 'home#index'
  resources :events, except: [:new, :destroy, :create]

  namespace :admin do
    resources :users
    resources :events
  end
end

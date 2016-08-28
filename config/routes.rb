Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'registrations'}
  root to: 'home#index'
  resources :events, only: [:show, :edit, :update]

  get :inner_sanctum, to: 'home#inner_sanctum'

  namespace :admin do
    resources :users
    resources :events, except: :show
  end
end

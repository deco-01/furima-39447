Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :users, only: [:edit, :update]
  resources :items, except: [:index] do
    resources :orders, only: [:index, :create]
  end
end
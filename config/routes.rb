Rails.application.routes.draw do
  devise_for :users
  get 'items/index'
  root to: 'items#index'
  resources :users, only: [:edit, :update]
  resources :items, only: [:new, :create]

  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  
  # validates :nickname, presence: true

end

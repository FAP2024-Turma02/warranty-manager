Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :invoices, only: [:index, :show]
  resources :warranties, only: [:index, :show]
  resources :users, only: [:index, :show, :create, :update]
  resources :stores, only: [:index, :show]
  resources :products, only: [:index, :show, :create, :update, :destroy]
  
end

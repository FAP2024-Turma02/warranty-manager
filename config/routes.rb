Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :invoices, only: [:index, :show, :create, :update, :destroy]
  resources :users, only: [:index, :show, :create, :update]
  resources :warranties, only: [:index, :show, :create, :update, :destroy]
  resources :stores, only: [:index, :show]
end

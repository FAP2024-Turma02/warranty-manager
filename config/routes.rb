Rails.application.routes.draw do
  devise_for :users

  resources :invoices, only: [:index, :show]
  resources :warranties, only: [:index, :show]
  resources :users, only: [:index, :show, :create, :update]
  resources :stores, only: [:index, :show]
end

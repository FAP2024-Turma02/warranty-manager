Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :users, except: :create
  resources :invoices, only: [:index, :show]
  resources :warranties, only: [:index, :show]

end

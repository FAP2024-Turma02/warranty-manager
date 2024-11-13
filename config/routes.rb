Rails.application.routes.draw do
  root to: proc { [200, { 'Content-Type' => 'application/json' }, [{ message: 'API está ativa' }.to_json]] }
  
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :invoices, only: [:index, :show, :create, :update]
  resources :warranties, only: [:index, :show]
  resources :users, only: [:index, :show, :create, :update]
  resources :stores, only: [:index, :show]
end

Rails.application.routes.draw do
  root to: proc { [200, { 'Content-Type' => 'application/json' }, [{ message: 'API está ativa' }.to_json]] }

  mount_devise_token_auth_for 'User', at: 'auth'

  resources :invoices, only: %i[index show create update destroy]
  resources :warranties, only: %i[index show create update destroy]
  resources :users, only: %i[index show create update destroy]
  resources :stores, only: %i[index show create update destroy]
  resources :products, only: %i[index show create update destroy]
end

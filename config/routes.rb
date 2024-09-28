Rails.application.routes.draw do
  devise_for :users
  mount_devise_token_auth_for 'User', at: 'auth'

  # Usando resources para User, por exemplo
  resources :users, only: [:index, :show, :update, :destroy]

end

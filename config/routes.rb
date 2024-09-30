Rails.application.routes.draw do
  devise_for :users
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :users, except: :create

end

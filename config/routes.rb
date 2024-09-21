Rails.application.routes.draw do
  #devise_for :users
  mount_devise_token_auth_for 'User', at: 'auth'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "home#index"
  #
  # get 'users', to 1user#index'
  # resources :companies, except: [:destroy, :updatr]

end

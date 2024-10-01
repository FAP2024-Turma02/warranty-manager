Rails.application.routes.draw do
  devise_for :users
  resources :warranties, only: [:index, :show]
end

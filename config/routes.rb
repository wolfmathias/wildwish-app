Rails.application.routes.draw do
  
  resources :keepers
  resources :donors
  resources :animals
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users, only: [:show]

  root 'users#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

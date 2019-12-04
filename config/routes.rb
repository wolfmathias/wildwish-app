Rails.application.routes.draw do
  
  # resources :donations
  resources :wishes, except: [:new, :show]
  # resources :toys
  resources :keepers
  # resources :donors
  resources :animals, except: [:show]
  
  # nested resources for new animal wish
  resources :animals, only: [:show] do
    resources :wishes, only: [:new, :show]
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users, only: [:show]

  root 'users#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

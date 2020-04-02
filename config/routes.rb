Rails.application.routes.draw do
  
  resources :zoos
  # resources :donations
  # resources :wishes, except: [:new, :show]
  # resources :toys
  resources :keepers # path: :users (aliasing path causing issues with signing out)

  # resources :donors
  resources :animals, except: [:show]
  delete 'animals/:id', to: 'animals#destroy', as: :destroy_animal

  # get 'animals/:id/wishes/:wishes_id', to: 'wishes#show'
  post 'donations/search', to: 'donations#search', as: :donations_search
  
  # for wishes
  resources :wishes, only: [:index]
  get 'wishes/active', to: 'wishes#active'
  post 'wishes', to: 'wishes#create'

  # toys
  get 'toys', to: 'toys#index'

  # to reset donations for specific wish (used for JS frontend concept only)
  post 'wishes/:id/reset_donations', to: 'wishes#reset_donations'
  get 'wishes/reset_active_wishes', to: 'wishes#reset_active_wishes'

  resources :donations, only: [:index, :show, :create]
  
  # nested resources for new animal wish
  resources :animals, only: [:show] do
    resources :wishes, only: [:show] do # do wishes need to be nested in animals?
      resources :donations, only: [:new]
    end
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

  resources :users, only: [:show]

  root 'users#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

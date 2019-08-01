Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #resources :users

  # get '/users', to: 'users#index', as: 'users'
  # get '/users/:id', to: 'users#show', as: 'user'
  # post '/users', to: 'users#create'
  # get '/users/new', to: 'users#new', as: 'new_user'
  # patch '/users/:id', to: 'users#update'
  # delete '/users/:id', to: 'users#destroy'
  # put '/users/:id', to: 'users#update'
  # get '/users/:id/edit', to: 'users#edit', as: 'edit_user'

  resources :users, only: [:index, :show, :create, :update, :destroy]

  resources :artworks, only: [:index, :show, :create, :update, :destroy]

  resources :artwork_shares, only: [:create, :destroy]

  get '/users/:user_id/artworks', to: 'artworks#index'

end

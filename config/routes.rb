Rails.application.routes.draw do
  root 'users#new'

  resources :songs
  resources :users, only: [:new, :create, :show]

  namespace :admin do
    resources :tags
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


resources :users, only: [:new, :create]
resources :home, only: [:index]
resources :comments, only: [:new, :create]
get '/sessions/login', to: 'sessions#new', as: :login
post '/sessions/login', to: 'sessions#create', as: nil
delete '/sessions/logout', to: 'sessions#destroy', as: :logout
resources :blogs, only: [:index, :show, :new, :create, :edit, :update, :destroy]
get '/about',to: 'about#index'
end

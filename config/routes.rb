Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


resources :users, only: [:new, :create]
resources :comments, only: [:new, :create]
post '/comment', to: 'blogs#index'
get '/sessions/login', to: 'sessions#new', as: :login
post '/sessions/login', to: 'sessions#create', as: nil
delete '/sessions/logout', to: 'sessions#destroy', as: :logout
resources :blogs, only: [:index, :show, :create, :edit, :update, :destroy]
get '/about',to: 'about#index'
get '/blogs/new/1',to: 'blogs#new', as: :newblog
#get '/articles', to: 'articles#index'
end

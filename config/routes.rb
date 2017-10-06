Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :blogs, only: [:index, :show, :edit, :update, :destroy]
get '/about',to: 'about#index'
#get '/articles', to: 'articles#index'
end

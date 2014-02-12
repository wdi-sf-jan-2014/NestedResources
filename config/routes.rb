NestedResources::Application.routes.draw do
  get "posts/index"
  devise_for :users

  get '/posts', to: 'posts#index', as: :posts
  root to: 'posts#index'
  get "posts/new"
  get "posts/show"
  get "posts/edit"

  # resources :users do
  	resources :posts do
  		resources :comments
  	end
  
end

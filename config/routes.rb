NestedResources::Application.routes.draw do
  get "posts/index"
  devise_for :users

  get '/posts', to: 'posts#index', as: :posts
  post "/posts", to: "posts#create"
  root to: 'posts#index'

  	resources :posts do
  		resources :comments
  	end
end

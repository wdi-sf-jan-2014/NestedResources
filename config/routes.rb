NestedResources::Application.routes.draw do 
  
  get "posts/create"
  get "posts/new"
  get "posts/show"
  get "comments/show"
  get "comments/index"
  get "comments/new"
  get "comments/create"
  get "comments/destroy"
  get "posts/index"
  devise_for :users

  get '/posts', to: 'posts#index', as: :posts
  root to: 'posts#new'

  resources :posts do
   	resources :comments
   end
end

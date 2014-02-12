NestedResources::Application.routes.draw do
  get "comments/new"
  get "comments/create"
  get "comments/show"
  get "comments/delete"
  get "posts/index"
  get "posts/new"
  get "posts/create"
  get "posts/show"
  get "posts/delete"
  devise_for :users
  resources :posts do
  	resources :comments

  end

  # get '/posts', to: 'posts#index', as: :posts
  root to: 'posts#index'
end

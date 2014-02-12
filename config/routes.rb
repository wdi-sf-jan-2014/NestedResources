NestedResources::Application.routes.draw do
  get "comments/new"
  get "comments/edit"
  get "comments/create"
  get "comments/show"
  get "comments/index"
  get "comments/update"
  get "posts/index"
  devise_for :users

  get '/posts', to: 'posts#index', as: :posts
  root to: 'posts#index'

  resources :posts do
	resources :comments
  end

  resources :comments do
	resources :comments
  end
end

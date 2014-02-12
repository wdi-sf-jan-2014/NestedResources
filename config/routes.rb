NestedResources::Application.routes.draw do
  get "comments/create"
  get "comments/new"
  get "comments/edit"
  get "comments/index"
  get "comments/update"
  get "comments/destroy"
  get "comments/show"
  get "posts/index"
  devise_for :users

  get '/posts', to: 'posts#index', as: :posts
  root to: 'posts#index'

  resources :users do
  	resources :posts
  end

  resources :users do
	  resources :posts do
  	  resources :comments
  	end
  end

 
  	

end

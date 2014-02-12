NestedResources::Application.routes.draw do
  # get "comments/new"
  # get "comments/index"
  # get "comments/create"
  # get "comments/show"
  # get "posts/index"
  devise_for :users

  get '/posts', to: 'posts#index', as: :posts
  root to: 'posts#index'

  resources :posts do 
  	resources :comments 
  end
  
end

#CAN ALSO DO THIS: 
#devise_for :users

# resources :posts, only: [:index], :new, :create, :show]
# resources :comments, only: [:show]
#root to: 'posts#index'


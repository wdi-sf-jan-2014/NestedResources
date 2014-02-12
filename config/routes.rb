NestedResources::Application.routes.draw do
  resources :posts do
    resources :comments
  end

  # get "posts/index"
  devise_for :users

  # get '/posts', to: 'posts#index', as: :posts
  root to: 'posts#index'

end

NestedResources::Application.routes.draw do
  get "posts/index"
  devise_for :users

  resources :posts, only: [:index, :new, :create, :show]
  root to: 'posts#index'
end

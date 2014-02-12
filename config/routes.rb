NestedResources::Application.routes.draw do
  get "posts/index"
  devise_for :users

  root to: 'posts#index'
  resources :posts do
    resources :comments
  end
end

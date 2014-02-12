NestedResources::Application.routes.draw do
  get "comments/new"
  devise_for :users

  resources :posts do
    resources :comments
  end

  root to: 'posts#index'
end

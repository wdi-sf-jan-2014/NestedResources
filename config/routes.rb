NestedResources::Application.routes.draw do
  # get "users/new"
  # get "users/show"
  # get "comments/new"
  devise_for :users

  resources :users, only: [:show]

  resources :posts, except: [:edit, :update] do
    resources :comments, only: [:new, :create]
  end

  root to: 'posts#index'
end

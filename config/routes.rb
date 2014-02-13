NestedResources::Application.routes.draw do
  devise_for :users

  post "/posts/:post_id/comments/:id", to: "comments#create_comment", as: "create_comment"

  resources :posts do
    resources :comments, only: [:show]
  end

  root to: 'posts#index'
end

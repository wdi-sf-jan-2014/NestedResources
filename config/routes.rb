NestedResources::Application.routes.draw do

  get "profiles/index"
  get "profiles/show"
  get "comments/index"
  get "comments/create"
  get "comments/show"
  get "comments/new"
  get "comments/update"
  get "comments/destroy"
  get "comments/edit"
  devise_for :users

  resources "posts" do
    resources "comments"
  end

  root to: 'posts#index'
end

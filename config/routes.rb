NestedResources::Application.routes.draw do

	root to: "posts#index"
  devise_for :users

  post "/posts/:post_id/new_comment/:id", to: "comments#comment_create"

  resources :posts do
  	resources :comments
  end

end

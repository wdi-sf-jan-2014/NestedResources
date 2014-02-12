NestedResources::Application.routes.draw do
  resources :posts do
  	resources :comments
  end

  root to: 'posts#index'
  
  get "posts/index"
  devise_for :users

  
end

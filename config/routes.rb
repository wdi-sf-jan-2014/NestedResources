NestedResources::Application.routes.draw do
  root "posts#index"
  devise_for :users

 resources :posts do
    resources :comments
  end

  resources :comments do
    resources :comments
  end
end

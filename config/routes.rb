NestedResources::Application.routes.draw do
  resources :comments do
    resources :comments 
  end

  resources :posts do 
    resources :comments 
  end
  
  devise_for :users

 
  root to: 'posts#index'

end

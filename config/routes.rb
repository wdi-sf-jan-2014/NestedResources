NestedResources::Application.routes.draw do

  resources :posts, :comments do 
    resources :comments 
  end
  
  devise_for :users

 
  root to: 'posts#index'

end

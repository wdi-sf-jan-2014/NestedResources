NestedResources::Application.routes.draw do
	
resources :posts do
  	resources :comments
end

devise_for :users
get '/posts', to: 'posts#index', as: :posts_to_index
root to: 'posts#index'

end
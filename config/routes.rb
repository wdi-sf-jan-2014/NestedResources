NestedResources::Application.routes.draw do

	resources :posts, only: [:index, :show, :new, :create] do
  	resources :comments, only: [:index, :show, :new, :create]
	end

  root to: 'posts#index'

  devise_for :users

end

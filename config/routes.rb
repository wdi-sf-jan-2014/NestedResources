NestedResources::Application.routes.draw do
	
  devise_for :users

  get '/posts', to: 'posts#index', as: :posts
  root to: 'posts#index'
  	
  	resources :posts, :comments do
  		resources :comments   	
  	end

  # post '/posts/:post_id/comments/:id', to: 'comments#upvote', as: :upvote
  # post '/comments/:comment_id/comments/:id', to: 'comments#upvote'
end

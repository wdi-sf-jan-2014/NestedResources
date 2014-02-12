NestedResources::Application.routes.draw do
  get "comments/new"
  devise_for :users
  root to: 'posts#index'

  resources :posts do
  resources :comments
  end
end

#            post_comments GET    /posts/:post_id/comments(.:format)          comments#index
#                          POST   /posts/:post_id/comments(.:format)          comments#create
#         new_post_comment GET    /posts/:post_id/comments/new(.:format)      comments#new
#             post_comment GET    /posts/:post_id/comments/:id(.:format)      comments#show
#                    posts GET    /posts(.:format)                            posts#index
#                          POST   /posts(.:format)                            posts#create
#                 new_post GET    /posts/new(.:format)                        posts#new
#                     post GET    /posts/:id(.:format)                        posts#show
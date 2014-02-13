NestedResources::Application.routes.draw do

  get "comments/index"
  get "comments/new"
  devise_for :users

  get '/posts', to: 'posts#index', as: :posts
  root to: 'posts#index'

  resources :users


  resources :posts do
  resources :comments
	end


  resources :photos do
  resources :comments
  end

end



# Rake Routes
# Prefix Verb   URI Pattern                                   Controller#Action
#           comments_index GET    /comments/index(.:format)                     comments#index
#             comments_new GET    /comments/new(.:format)                       comments#new
#         new_user_session GET    /users/sign_in(.:format)                      devise/sessions#new
#             user_session POST   /users/sign_in(.:format)                      devise/sessions#create
#     destroy_user_session GET    /users/sign_out(.:format)                     devise/sessions#destroy
#            user_password POST   /users/password(.:format)                     devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)                 devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)                devise/passwords#edit
#                          PATCH  /users/password(.:format)                     devise/passwords#update
#                          PUT    /users/password(.:format)                     devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)                       devise/registrations#cancel
#        user_registration POST   /users(.:format)                              devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)                      devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)                         devise/registrations#edit
#                          PATCH  /users(.:format)                              devise/registrations#update
#                          PUT    /users(.:format)                              devise/registrations#update
#                          DELETE /users(.:format)                              devise/registrations#destroy
#                    posts GET    /posts(.:format)                              posts#index
#                     root GET    /                                             posts#index
#                    users GET    /users(.:format)                              users#index
#                          POST   /users(.:format)                              users#create
#                 new_user GET    /users/new(.:format)                          users#new
#                edit_user GET    /users/:id/edit(.:format)                     users#edit
#                     user GET    /users/:id(.:format)                          users#show
#                          PATCH  /users/:id(.:format)                          users#update
#                          PUT    /users/:id(.:format)                          users#update
#                          DELETE /users/:id(.:format)                          users#destroy
#                 comments GET    /comments(.:format)                           comments#index
#                          POST   /comments(.:format)                           comments#create
#              new_comment GET    /comments/new(.:format)                       comments#new
#             edit_comment GET    /comments/:id/edit(.:format)                  comments#edit
#                  comment GET    /comments/:id(.:format)                       comments#show
#                          PATCH  /comments/:id(.:format)                       comments#update
#                          PUT    /comments/:id(.:format)                       comments#update
#                          DELETE /comments/:id(.:format)                       comments#destroy
#            post_comments GET    /posts/:post_id/comments(.:format)            comments#index
#                          POST   /posts/:post_id/comments(.:format)            comments#create
#         new_post_comment GET    /posts/:post_id/comments/new(.:format)        comments#new
#        edit_post_comment GET    /posts/:post_id/comments/:id/edit(.:format)   comments#edit
#             post_comment GET    /posts/:post_id/comments/:id(.:format)        comments#show
#                          PATCH  /posts/:post_id/comments/:id(.:format)        comments#update
#                          PUT    /posts/:post_id/comments/:id(.:format)        comments#update
#                          DELETE /posts/:post_id/comments/:id(.:format)        comments#destroy
#                          GET    /posts(.:format)                              posts#index
#                          POST   /posts(.:format)                              posts#create
#                 new_post GET    /posts/new(.:format)                          posts#new
#                edit_post GET    /posts/:id/edit(.:format)                     posts#edit
#                     post GET    /posts/:id(.:format)                          posts#show
#                          PATCH  /posts/:id(.:format)                          posts#update
#                          PUT    /posts/:id(.:format)                          posts#update
#                          DELETE /posts/:id(.:format)                          posts#destroy
#           photo_comments GET    /photos/:photo_id/comments(.:format)          comments#index
#                          POST   /photos/:photo_id/comments(.:format)          comments#create
#        new_photo_comment GET    /photos/:photo_id/comments/new(.:format)      comments#new
#       edit_photo_comment GET    /photos/:photo_id/comments/:id/edit(.:format) comments#edit
#            photo_comment GET    /photos/:photo_id/comments/:id(.:format)      comments#show
#                          PATCH  /photos/:photo_id/comments/:id(.:format)      comments#update
#                          PUT    /photos/:photo_id/comments/:id(.:format)      comments#update
#                          DELETE /photos/:photo_id/comments/:id(.:format)      comments#destroy
#                   photos GET    /photos(.:format)                             photos#index
#                          POST   /photos(.:format)                             photos#create
#                new_photo GET    /photos/new(.:format)                         photos#new
#               edit_photo GET    /photos/:id/edit(.:format)                    photos#edit
#                    photo GET    /photos/:id(.:format)                         photos#show
#                          PATCH  /photos/:id(.:format)                         photos#update
#                          PUT    /photos/:id(.:format)                         photos#update
#                          DELETE /photos/:id(.:format)                         photos#destroy
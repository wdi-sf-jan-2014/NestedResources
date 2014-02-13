class PostsController < ApplicationController
  before_filter :authenticate_user!
 
  def index
    @posts = current_user.posts
  end

  def new
    @post = Post.new 
  end

  def create
    post_params = params.require(:post).permit(:link, :body, comments_attributes: [ :body ])
    post = current_user.posts.create(post_params)
    redirect_to post_path(post.id)
  end

  def show
    @post = current_user.posts.find(params[:id])
  end

end

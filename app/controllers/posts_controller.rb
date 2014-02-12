class PostsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @posts = current_user.posts
  end

  def new
  end

  def create
    params.require(:post).permit(:link, :body)
    post = current_user.posts.create(params[:post])
    redirect_to post_path(post.id)
  end
end

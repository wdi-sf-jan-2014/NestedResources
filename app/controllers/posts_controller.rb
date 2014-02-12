class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.create(params.require(:post).permit(:link, :body))

    redirect_to post_comments_path(post.id)
  end
end

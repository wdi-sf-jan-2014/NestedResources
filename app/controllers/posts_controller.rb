class PostsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @posts = Post.all

  end

  def new
    @post = Post.new
  end

  def create
    new_post = params.require(:post).permit(:link, :body)
    post = Post.create(new_post)

    redirect_to root_path

  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = @post.comments.build
  end

  def destroy
  end
end

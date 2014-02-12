class PostsController < ApplicationController
  def index
  	@posts = Post.all
  end

  def new
  	@post = Post.new()
  end

  def create
  	new_post = params.require(:post).permit(:link, :body)
  	post = Post.create(new_post)
  	redirect_to posts_path
  end

  def show
  	@post = Post.find(params[:id])
  end
end

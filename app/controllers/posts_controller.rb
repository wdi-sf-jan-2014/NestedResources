class PostsController < ApplicationController

  def new
  	@post = Post.new
  end

  def edit
  end

  def create
  	parameters = params.require(:post).permit(:link, :body)
  	post = Post.create(parameters)
  	redirect_to post_path(post)
  end

  def show
  	@post = Post.find(params[:id])
  end

  def index
  	@posts = Post.all
  end

  def update
  end

end

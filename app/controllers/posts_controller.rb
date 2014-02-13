class PostsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  def index
  	@posts = Post.all()
  	
  end

  def show
  	@post = Post.find(params[:id])
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.create(params.require(:post).permit(:link, :body))
  	redirect_to post_path(@post)
  end

  def destroy
  	post = Post.find(params[:id])
  	post.destroy
  	redirect_to root_path
  end

end

class PostsController < ApplicationController
  
  def index
    @post = Post.all
  end

  def new
   
  	@post = Post.new
  end

  def create
  	post = Post.create(params[:post].permit(:link, :body))
    redirect_to post_path(post)
  end

  def update
  end

  def delete
  end

  def show
    @post = Post.find(params[:id])
  end


end

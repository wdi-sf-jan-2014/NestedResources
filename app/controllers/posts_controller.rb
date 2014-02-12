class PostsController < ApplicationController
  
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.create(params[:post].permit(:link, :body, :comments_attributes=>[:body]))
    redirect_to post
  end

  def show
    @post = Post.find(params[:id])
  end
  
end

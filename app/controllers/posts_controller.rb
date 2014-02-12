class PostsController < ApplicationController
  def index
  	@posts = Post.all unless Post.all.nil?
  end

  def new
  	@post = Post.new
  end

  def create
  	new_post = params.require(:post).permit(:link, :body)
  	@post = Post.create(new_post)
  	redirect_to @post
  end

  def show
  	@post = Post.find(params[:id])
  end

  def delete
  	post = Post.find(params[:id])
  	Post.destroy(post)
  	redirect_to posts
  end
end

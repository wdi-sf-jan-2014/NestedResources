class PostsController < ApplicationController

  def show
  	@post = Post.find(params[:id])
  end

  def edit
  	@post = Post.find(params[:id])
  end

  # def update
  # updated_post = params.require(:post).permit(:link, :body)
  # post = Post.find(params[:id])
  # post.update_attributes(updated_post)
  # # redirect_to updated_post_path
  # end

  def index
  	@post = Post.all

  end

  def new
  	@post = Post.new
  end

  def create
  	# raise params.inspect
  	post = Post.create(params[:post].permit(:body, :link, :comments_attributes=>[:body]))
  	redirect_to post
  end
end

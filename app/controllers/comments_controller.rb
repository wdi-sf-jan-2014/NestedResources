class CommentsController < ApplicationController
  def index
  end

  def show
  	@post = Post.find(params[:post_id])
  	@comment = @post.comments.find(params[:id])
  end

  def new
  	@post = Post.find(params[:post_id])
  	@comment = @post.comments.new
  end

  def create
  	@post = Post.find(params[:post_id])
  	@comment = @post.comments.create(params[:comment].permit(:body))
    binding.pry

  	

  end
end

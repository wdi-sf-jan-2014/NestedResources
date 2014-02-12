class PostsController < ApplicationController
  def index
  @post = Post.all
  @new_post = Post.new
  end

  def create
  post = Post.create(params[:post].permit(:title, :comments_attributes =>[:say]))
  redirect_to post
  end

  def show
  @post = Post.find(params[:id])
  @comment = @post.comments.new
  end

end
class PostsController < ApplicationController
	before_filter :authenticate_user!
  def index
  	@posts = Post.all
  end

  def show
  	@post = Post.find(params[:id])
  end

  def new
  	@post = Post.new
  end

  def create
  	post = Post.create(params[:post].permit(:link, :body, :comments_attributes =>[:body]))
  	redirect_to post_comments(post)
  	# alex put post_path(post.id)
  end

  def delete
  end

end

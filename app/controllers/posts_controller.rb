class PostsController < ApplicationController
  
  

  def index
  	@posts = current_user.posts
  end

  def new
  	@post = Post.new
  end

  def create
  	new_post = params.require(:post).permit(:link, :body)
  	post = Post.create(new_post)
  	redirect_to post
  end

  def show
  	@post = Post.find(params[:id])
  end
end

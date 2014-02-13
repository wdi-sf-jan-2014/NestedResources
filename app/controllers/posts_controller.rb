class PostsController < ApplicationController
before_filter :authenticate_user!, :except => [:index]
 
  def index
  	@posts = Post.all
  end

  def new
  	@post = Post.new
  end

  def create 
   new_post = params.require(:post).permit(:link, :body)
	 @post = current_user.posts.creat(new_post)
   LinksWorker.perform_async(@post.id)
	 redirect_to post_path(@post)
  end

  def show
  	@post = Post.find(params[:id])
  end

end

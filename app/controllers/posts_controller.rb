class PostsController < ApplicationController
  def index
  	@posts = Post.all
  end

  def new
  	@user = current_user
  	@post = @user.posts.new
  end

  def create
  	# raise params.inspect
  	
  	post = current_user.posts.create(params.require(:post).permit(:link, :body))

  	redirect_to post_path(post)
  end

  def show
  	@user = current_user
  	@post = current_user.posts.find(params[:id])
  	@comments = @post.comments.all
  end
end

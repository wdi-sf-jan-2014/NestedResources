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
	@post = Post.create(new_post)
	redirect_to post_path(@post)
  end

  def show
  	@post = Post.find(params[:id])
  	#binding.pry
	# if @post.comments.nil?
	# 	@comments = @post.comments.find(@post.comments)
	# end
  end

end

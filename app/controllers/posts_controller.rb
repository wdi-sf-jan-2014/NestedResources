class PostsController < ApplicationController
before_filter :authenticate_user!
	def index
		@posts = Post.all
	end


	def new
  @post = Post.new
	end
 
	def create
  @post = Post.new(params[:post].permit(:title, :text, :link))
 
	  if @post.save
	    redirect_to @post
	  else
	    render 'new'
	  end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def show
		@post = Post.find(params[:id])
    @commentable = @post
    @comments = @commentable.comments
    @comment = Comment.new
	end

	def update
  @post = Post.find(params[:id])
 
	  if @post.update(params[:post].permit(:title, :text, :link))
	    redirect_to @post
	  else
	    render 'edit'
	  end
	end

	def destroy
  @post = Post.find(params[:id])
  @post.destroy
  redirect_to posts_path
  end

end

	 private
	 def post_params
	    params.require(:post).permit(:title, :text, :link)
	 end
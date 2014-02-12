class CommentsController < ApplicationController
before_filter :authenticate_user!

  def edit
  	@post = Post.find(params[:post_id])
  	@comment = @post.comments.find(params[:id])
  	#binding.pry
  end

  def show
  	@post = Post.find(params[:post_id])
  	@comment = @post.comments.find(params[:id])
  end

  def index
  	@post=Post.find(params[:post_id])
  end

  def new
  	@post = Post.find(params[:post_id])
  	@comment = @post.comments.new
  end

  def create
	@post = Post.find(params[:post_id])
  	new_post = params.require(:comment).permit(:body)
  	@comment = @post.comments.create(new_post)
  	redirect_to post_comment_path(@post.id, @comment.id)
  end

  def update
  	@post = Post.find(params[:post_id])
  	@comment = @post.comments.find(params[:id])
  	updated_comment = params.require(:comment).permit(:body)
  	@comment.update_attributes(updated_comment)
  	redirect_to post_comment_path(@post.id, @comment.id)
  end

end

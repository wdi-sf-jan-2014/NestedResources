class CommentsController < ApplicationController
before_filter :authenticate_user!
  def new
    @comment = @parent.comments.build
    @post = Post.find(params[:post_id])
  end

  def show
  	@post = Post.find(params[:post_id])
  	@comment = @post.comments.find(params[:id])
  end

  def index
  	@post=Post.find(params[:post_id])
  end

  def create
	  @post = Post.find(params[:post_id])
  	new_post = params.require(:comment).permit(:body)
  	@comment = @post.comments.create(new_post)
  	redirect_to post_comment_path(@post.id, @comment.id)
  end

  def update
    new_comment = params.require(:comment).permit(:body)
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.comments.create(new_comment)
    redirect_to post_path(@post.id)
  end


end

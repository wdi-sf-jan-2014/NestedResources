class CommentsController < ApplicationController
before_filter :authenticate_user!
  def new
    @comment = Comment.new    
    @post = Post.find(params[:post_id])
  end

  def show
  	@post = Post.find(params[:post_id])
  	@comment = @post.comments.find(params[:id])
  end

  def index
  	@post=Post.find(params[:post_id])
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def create
    
	  @post = Post.find(params[:post_id])
  	new_post = params.require(:comment).permit(:body, :post_id)
  	@comment = @post.comments.create(new_post)
    binding.pry
  	redirect_to post_path(@post.id, @comment.id)
  end

  def update
    new_comment = params.require(:comment).permit(:body)
    if (params[:id])=='new'
      @comment = Comment.find(params[:format])
      @comment.comments.create(new_comment)
      redirect_to post_path(@comment.commentable.id)
    else
      @comment = Comment.find(params[:id])
      @post = Post.find(params[:post_id])
      updated_comment = params.require(:comment).permit(:body)
      @comment.update_attributes(updated_comment)
      redirect_to post_path(@post.id)
    end
  end


end

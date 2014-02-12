class CommentsController < ApplicationController
  def index
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.find(params[:id])
    @comment = @post.comments.new
  end

  def create
    new_comment = params.require(:comment).permit(:body)
    post = Post.find(params[:post_id])
    comment = post.comments.create(new_comment)
    redirect_to post_comment_path(post, comment)
  end

  def show
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def update
    updated_comment = params.require(:comment).permit(:body)
    post = Post.find(params[:post_id])
    comment = post.comments.find(params[:id])
    comment.update_attributes(updated_comment)
    redirect_to post_comment_path(post, comment) 
  end

  def destroy
  end
end

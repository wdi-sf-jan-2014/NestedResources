class CommentsController < ApplicationController
  def index
    @comment = Comment.find(params[:comment_id])
  end

  def show
    @comment = Comment.find(params[:comment_id])
    @post = @comment.posts.find(params[:id])
  end

  def new
    @comment = Comment.find(params[:comment_id])
    @post = @comment.posts.new()
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params.require(:comment).permit(:body))
    redirect_to post_comment_path(@post, @comment)
  end

  def delete
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to root_path
  end
end

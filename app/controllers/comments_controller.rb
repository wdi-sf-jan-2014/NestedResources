class CommentsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  def index
    @post = Post.find(params[:post_id])
  end

  def show
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new()
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params.require(:comment).permit(:body))
    redirect_to post_comment_path(@post, @comment)
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to root_path
  end
end

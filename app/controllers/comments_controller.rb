class CommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
  end

  def new
    @post = Post.find(params[:post_id])
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
end

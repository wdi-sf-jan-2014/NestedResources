class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def create
    post = Post.find(params[:post_id])
    comment_parameters = params.require(:comment).permit(:body)
    post.comments.create(comment_parameters)
    redirect_to post_path(post)
  end

  def show
    @comment = Comment.find_by_id(params[:id])
  end

  def index
  end

  def update
  end

end

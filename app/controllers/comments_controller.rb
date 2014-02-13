class CommentsController < ApplicationController
  def index
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  def create
    post = Post.find(params[:post_id])
    comment = post.comments.create(get_comment_params)

    redirect_to post_comment_path(post, comment)
  end

  def show
    @post = Post.find(params[:post_id])
    @comment = []
    @comment << @post.comments.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  
  def get_comment_params
    params.require(:comment).permit(:body)
  end
end

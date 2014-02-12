class CommentsController < ApplicationController
  def index
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build
  end

  def create
    post = Post.find(params[:post_id])
    new_comment = post.comments.create(comment_params) 
    current_user.comments << new_comment
    redirect_to post_path(post)
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
    post = Post.find(params[:post_id])
    updated_comment = post.comments.find(params[:id])
    updated_comment.update(comment_params)
    redirect_to post_comment_path(post, updated_comment)
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_body)
  end
end

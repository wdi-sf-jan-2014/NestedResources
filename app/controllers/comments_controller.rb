class CommentsController < ApplicationController
  before_filter :authenticate_user!
  def show
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])
  end

  def create
    post = Post.find(params[:post_id])
    comment = post.comments.create(params[:comment].permit(:body))
    current_user.comments << comment
    redirect_to post_path(post)
  end

  def create_comment
    comment = Comment.find(params[:id])
    new_comment = comment.comments.create(params[:comment].permit(:body))
    current_user.comments << new_comment
    redirect_to post_comment_path(params[:post_id], comment.id)
  end




end

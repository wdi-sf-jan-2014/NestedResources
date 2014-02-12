class CommentsController < ApplicationController
  def new
  end

  def show
    post_id = params[:post_id]
    @post = Post.find(post_id)
    comment_id = params[:id]
    @comment = Comment.find(comment_id)
  end
end

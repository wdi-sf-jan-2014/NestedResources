class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build
  end

  def show
     post_id = params[:post_id]
     @post = Post.find(post_id)
     comment_id = params[:id]
     @comment = Comment.find(comment_id)

  end

  def create
    new_comment = params.require(:comment).permit(:body)
    post = Post.find(params[:post_id])
    comment = post.comments.create(new_comment)

    redirect_to post_comment_path(post, comment)
  end


end

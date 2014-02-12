class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build
  end

  def create
    post = Post.find(params[:post_id])
    new_comment = params.require(:comment).permit(:body)

    post = post.comments.create(new_comment)

    redirect_to post_path(params[:post_id])

  end
end

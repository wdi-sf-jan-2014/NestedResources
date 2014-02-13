class CommentsController < ApplicationController
  # def new
  #   @post = Post.find(params[:post_id])
  #   @comment = @post.comments.build
  # end

  def create
    post = Post.find(params[:post_id])
    new_comment = params.require(:comment).permit(:body)
    new_comment[:commentable_id] = params[:id]
    new_comment[:commentable_type] = @comment_type
    binding.pry

    comment = post.comments.create(new_comment)

    redirect_to post_path(params[:post_id])

  end

  def show
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @new_comment = @post.comments.build
  end
end

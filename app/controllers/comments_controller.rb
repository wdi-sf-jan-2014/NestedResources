class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def new 
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new

  end

  def create 
    @post = Post.find(params[:post_id])
    
    new_comment = params[:comment].permit(:body)
    @comment = @post.comments.create(new_comment)
    redirect_to post_comment_path(@post, @comment)

  end

  def show
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment_comments = @comment.comments

  end

  def edit 
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])

    updated_comment = params.require(:comment).permit(:body, comments_attributes: [:body])
    @comment = @post.comments.find(params[:id]).update_attributes(updated_comment)
    redirect_to post_comment_path

  end

  def delete

  end
end

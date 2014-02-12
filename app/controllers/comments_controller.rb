class CommentsController < ApplicationController
  def index
  end

  def create
    post = params[:post_id]
    post = Post.find(post)
    new_comment = params[:comment].permit(:body)
    comment = post.comments.create(new_comment)
    redirect_to post_comment_path(post, comment)

  end

  def new
    id = params[:post_id]
    @post = Post.find(id)
    @comment = Comment.new
  end

  def edit
    comment_id = params[:id]
    post_id = params[:post_id]
    @comment = Comment.find(comment_id)
    @post = Post.find(post_id)
  end

  def show
    id = params[:post_id]
    @post = Post.find(id)
    @comment = @post.comments
  end

  def update
    comment_id = params[:id]
    post_id = params[:post_id]
    update_post = params[:comment].permit(:body)
    comment = Comment.find(comment_id)
    comment.update_attributes(update_post)
    redirect_to post_comment_path(post_id, comment_id)

  end

  def destroy
  end
end

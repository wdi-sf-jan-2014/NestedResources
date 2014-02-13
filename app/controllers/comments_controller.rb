class CommentsController < ApplicationController
  before_filter :authenticate_user!
  

  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build
  end

  def create
    post = Post.find(params[:post_id])
    new_comment = params.require(:comment).permit(:body)
    comment = post.comments.create(new_comment)
    redirect_to post_comment_path(post, comment)
  end

  def show
    @post = Post.find(params[:post_id])
    comments = @post.comments
    comment_id = params[:id]
    @comment = comments.find(comment_id)
  end

  def edit
    @post = Post.find(params[:post_id])
    comments = @post.comments
    comment_id = params[:id]
    @comment = comments.find(comment_id)
    render :edit
  end

  def update
    @post = Post.find(params[:post_id])
    comments = @post.comments
    comment_id = params[:id]
    comment = comments.find(comment_id)
    new_commentable_body = params.require(:comment).permit(:body)
    new_commentable = comment.comments.build(new_commentable_body)
    redirect_to post_comment_path 
  end
  
end
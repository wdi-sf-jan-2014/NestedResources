class CommentsController < ApplicationController
  before_filter :get_parent

  def index
  end

  def new
    @comment = @parent.comments.build
  end

  def create

    new_comment = @parent.comments.build(comment_params)
    if new_comment.save
      redirect_to root_url
    else
      render :new
    end
  end

  def show
    @comment = @parent.comments.find(params[:id])

  end

  def edit
    # @post = Post.find(params[:post_id])
    @comment = @parent.comments.find(params[:id])
  end

  def update
    post = Post.find(params[:post_id])
    updated_comment = post.comments.find(params[:id])
    updated_comment.update(comment_params)
    redirect_to post_comment_path(post, updated_comment)
  end

  def destroy
  end

  def upvote
    session[:return_to] ||= request.referer
    comment = @parent.comments(params[:id])
    comment.count
    redirect_to session.delete(:return_to)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_body)
  end

  def get_parent
    @parent = Post.find_by_id(params[:post_id]) if params[:post_id]
    @parent = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
  end

end

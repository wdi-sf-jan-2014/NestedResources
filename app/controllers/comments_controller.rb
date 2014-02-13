class CommentsController < ApplicationController
  before_filter :get_parent

  def index
  end

  def new
    @comment = @parent.comments.new
    @post = @comment.post
  end

  def create
    comment_params = get_comment_params
    comment_params[:user_id] = current_user.id
    comment = @parent.comments.build(comment_params)
    if comment.save
      comment.update_attributes(post_id: comment.post.id)
      redirect_to post_path(comment.post_id)
    else
      render :new
    end

  end

  def show
    @comment = @parent.comments.find(params[:id])
    @post = Post.find(@comment.post_id)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  
  def get_comment_params
    params.require(:comment).permit(:body)
  end

  def get_parent
    @parent = Post.find_by_id(params[:post_id]) if params[:post_id]
    @parent = Comment.find_by_id(params[:comment_id]) if params[:comment_id]

    redirect_to root_path unless defined?(@parent)
  end

end

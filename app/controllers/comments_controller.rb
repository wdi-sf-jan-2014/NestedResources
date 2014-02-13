class CommentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_parent

  def new 
    @comment = @parent.comments.build
  end

  def create     
    @comment = @parent.comments.build(params.require(:comment).permit(:body))
    if @comment.save
      redirect_to posts_path(@comment.post)
    else
      render :new
    end
  end

  def show
    @comment = @post.comments.find(params[:id])
    @comment_comments = @comment.comments

  end

  def edit 
    @comment = @parent.comments.find(params[:id])
  end

  def update

    updated_comment = params.require(:comment).permit(:body, comments_attributes: [:body])
    @comment = @parent.comments.find(params[:id]).update_attributes(updated_comment)
    redirect_to post_comment_path

  end

  def delete

  end

  protected 
   
  def get_parent
    @parent = Post.find_by_id(params[:post_id]) if params[:post_id]
    @parent = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
     
    redirect_to root_path unless defined?(@parent)
  end

end

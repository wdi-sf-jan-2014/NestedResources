class CommentsController < ApplicationController
  before_filter :get_parent

  def index
  end

  def new
    @comment = @parent.comments.build
  end

  def create
    @comment = @parent.comments.build(comment_params)
      if @comment.save
        redirect_to post_path(@comment.post)
      else 
        render :new
      end
    # post = Post.find(params[:post_id])
    # new_comment = post.comments.create(comment_params) 
    # # current_user.comments << new_comment
    # redirect_to post_path(post)
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

  private

  def comment_params
    params.require(:comment).permit(:comment_body)
  end

  protected

  def get_parent
    @parent = Post.find_by_id(params[:post_id]) if params[:post_id]
    @parent = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
     
    redirect_to root_path unless defined?(@parent)
  end

end

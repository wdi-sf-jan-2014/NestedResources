class CommentsController < ApplicationController
  before_filter :load_commentable
  def index
    @commentable = Post.find(params[:post_id])
    @comments = @commentable.comments
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    if @comment.save
      redirect_to @commentable, notice: "Comment created."
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def load_commentable
    resource, id = request.path.split('/')[1,2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end

end


  create
  post = Post.find(params[:post_id])
  new_comment = comment.comments.create(params[:comment].permit(:body)
    current_user.comments << comment
    redirect_to post_path(post)
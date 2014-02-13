class CommentsController < ApplicationController
  before_filter :get_parent

  def index
    # @post = Post.find(params[:post_id])
  end

  def new
    # @post = Post.find(params[:post_id])
    @comment = @parent.comments.build
  end

  def show
    @post = Post.find(params[:post_id])
    @comment = @parent.comments.find(params[:id])
  end

  def create
    # post = Post.find(params[:post_id])
    # new_comment = params.require(:comment).permit(:body)
    # comment = post.comments.create(new_comment)
    # redirect_to post_path(post)

    new_comment = @parent.comments.build(params.require(:comment).permit(:body))
    if new_comment.save
      redirect_to root_url
    else
      render :new
    end
  end

  def update
  end

  def edit
  end

  protected
  def get_parent
    @parent = Post.find_by_id(params[:post_id]) if params[:post_id]
    @parent = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
  end
end

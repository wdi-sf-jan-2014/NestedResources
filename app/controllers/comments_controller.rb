class CommentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_parent

  
  def show
    @comment = Comment.find(params[:id])
  end

  def new
  	#id = params[:comment_id]
    @comment = @parent.comments.build
  	#@comment = Comment.find(id)
  end

  def create
  	c= @parent.comments.build(params.require(:comment).permit(:body))
  	# id = params[:comment_id]
  end

private
	def get_parent
	    @parent = Post.find_by_id(params[:post_id]) if params[:post_id]
	    @parent = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
	     
	    redirect_to root_path unless defined?(@parent)
	  end
	end

class CommentsController < ApplicationController
  
  def index
  	@post = Post.find(params[:post_id])
  	@comments = @post.comments.all
  end

  def new
  	@post = Post.find(params[:post_id])
  	@comment = @post.comments.build
  end

  def create
  	@post = Post.find(params[:post_id])
  	new_comment = params.require(:comment).permit(:body)
  	@post.comments.create(new_comment)
  	redirect_to post_path(@post)
  end

  def show
  	@post = Post.find(params[:post_id])
  	@comment = @post.comments.find(params[:id])
  end

end

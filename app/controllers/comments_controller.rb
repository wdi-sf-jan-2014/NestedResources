class CommentsController < ApplicationController
	before_filter :authenticate_user!, only: [:create, :new, :edit, :update]
  def new
  	@post = Post.find(params[:post_id])
  	@comment = @post.comments.build
  end

  def show
  	@post = Post.find(params[:post_id])
  	@comment = @post.comments.find(params[:id])
  end

  def create
  	post = Post.find(params[:post_id])
  	new_comment_body = params.require(:comment).permit(:body)
  	comment = post.comments.create(new_comment_body)

  	redirect_to post_comment_path(post, comment)
  end

  def update
    #add sub comments here 
    post = Post.find(params[:post_id])
    comment = post.comments.find(params[:id])
    new_comment_body = params.require(:comment).permit(:body)
    comment.comments.create(new_comment_body) 

    redirect_to post_comment_path(post, comment)

  end
end

class CommentsController < ApplicationController
  def new
  	@post = Post.find(params[:post_id])
    @comment = @post.comments.build
  end

  def create
  	comment = params.require(:comment).permit(:body)
    post = Post.find(params[:post_id])
    new_comment = post.comments.create(comment)
    redirect_to post_comment_path(post, new_comment)
  end

  def show
  	@post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id]).body
  end

  def delete
  	post = Post.find(params[:post_id])
	bye_bye_comment = post.comments.find(params[:id])
	bye_bye_comment.destroy  	
  end
end

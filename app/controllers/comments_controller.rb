class CommentsController < ApplicationController
  def new
  	@post = Post.find(params[:post_id])
  	@comment = @post.comments.build
  end

  def create
    post = Post.find(params[:post_id])
  	new_comment = params.require(:comment).permit(:body)
    binding.pry
    # new_comment[:post_id] = post.id
  	comment = post.comments.create(new_comment)
  	redirect_to post_comment_path(id: comment)
  end

  def show
  	@post = Post.find(params[:post_id])
  	@comment = @post.comments.find(params[:id])
  end
end

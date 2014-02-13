class CommentsController < ApplicationController

  def new 
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build 
  end 

  def create 
    # here we are creating a comment linked to a post
    post = Post.find(params[:post_id])    
    # here we are creating a comment that is assoc with the post id
    new_comment = params.require(:comment).permit(:body)
    # below post w/ above id is assoc with a new comment in a hash
    post = post.comment.create(new_comment)
    # now that the comment linked to post with params x we redirect to 
    # that post_path 
    redirect_to post_path(params[:post_id])
  end 

end



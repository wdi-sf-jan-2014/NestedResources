class CommentsController < ApplicationController

def create
  new_comment = params.require(:comment).permit(:say)
  post = Post.find(params[:post_id])  
  comment =  post.comments.create(new_comment)
  redirect_to post_path(post)
end

def show
@post = Post.find(params[:post_id])
@comment = @post.comments.find(params[:id])
end

end

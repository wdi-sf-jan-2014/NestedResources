class CommentsController < ApplicationController

def index
@comments = Comment.all
end

def show
  @post = Post.find(params[:post_id]) 
  @comment = @post.comments.find(params[:id])
end 

def create
  new_comment = params.require(:comment).permit(:say)
  post = Post.find(params[:post_id])  
  comment =  post.comments.create(new_comment)
  redirect_to post_path(post)
end

def destroy
  @post = Post.find(params[:post_id]) 
  @comment = Comment.find(params[:id])
  @comment.destroy
  redirect_to post_path(@post)
end

end

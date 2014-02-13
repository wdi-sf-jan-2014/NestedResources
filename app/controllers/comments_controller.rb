class CommentsController < ApplicationController
before_filter :load_commentable

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
  redirect_to post_path(post)
end

private

  def load_commentable
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end


end

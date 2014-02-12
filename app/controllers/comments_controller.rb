class CommentsController < ApplicationController
  def index
    @posts = Post.all
  end

  def create
    @user = User.find(current_user.id)
    @post = @user.posts.find(params[:post_id])
    @comment = @post.comments.create(comment_parameters)
    redirect_to root_path
  end

  def new
    @user = User.find(current_user.id)
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  def edit
    @user = User.find(current_user.id)
    @post = @user.posts.find(params[:post_id])

end

  def update
    @user = User.find(current_user.id)
    @post = @user.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.update(comment_parameters)
    redirect_to root_path
  end

  def destroy
    @user = User.find(current_user.id)
    @post = @user.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @post.delete
    redirect_to root_path
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

  end

  private
  def comment_parameters
    params.require(:comment).permit(:body)
  end
end

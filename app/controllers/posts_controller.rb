class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new 
    @post = Post.new
  end 

  def create 
    new_post = params.require(:post).permit(:title, :link, :body)
    post = Post.create(new_post)
    redirect_to root_path
  end 

  def show 
    # we are going to find post by id which is implicit 
    # so params[:post_id] is not needed
    @post = Post.find(params[:id])
    @comments = @post.comments 
    @comment = @post.comments.build
  end 

end







#   def show
#     @post = Post.find(params[:id])
#     @comments = @post.comments
#     @comment = @post.comments.build
#   end

class PostsController < ApplicationController
before_filter :authenticate_user!

  def index
    @posts = current_user.posts
  end

  def show
    @post = current_user.posts.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    
    #post = Post.create(params[:post].permit(:body, :comments_attributes=>[:body]))
    #redirect_to post
  end

  def destroy
  end

end

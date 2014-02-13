class PostsController < ApplicationController
  before_action :authenticate_user!, :except => [:index]
  
  def index
    @posts = Post.all
  end  

  def new
    @post = Post.new
  end

  def create
    new_post = params.require(:post).permit(:link, :body, comments_attributes: [:body])
    @post = Post.new(new_post)

    if @post.save
      redirect_to posts_path
    else
      render :action => :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @post_comments = @post.comments
  end
  
  def edit 
    @post = Post.find(params[:id])
  end

  def update
    updated_post = params[:post].permit(:link, :body)
    @post = Post.find(params[:id]).update_attributes(updated_post)
    redirect_to post_path
  end


  def destroy 

  end

end

class PostsController < ApplicationController
  before_action :authenticate_user!, :except => [:index]
  
  def index
    @posts = Post.all
  end  

  def new
    @post = Post.new()
  end

  def create
    new_post = params[:post].permit(:link, :body, :comments_attributes => [:body])
    @post = Post.create(new_post)
    redirect_to post_path(@post)   

  end

  def show

    @post = Post.find(params[:id])
    
    if @post.comments.nil?
      @comments = @post.comments.find(@post.comments)
    end

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

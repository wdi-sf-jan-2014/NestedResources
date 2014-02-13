class PostsController < ApplicationController
  def index
  	@posts=Post.all
  end
  
  def new
  	@post=Post.new
  end

  def create
    post = Post.create(params[:post].permit(:link, :body, :comments_attributes=>[:commentbody]))

    redirect_to posts_path
  end
  
  def show
    post = Post.find(params[:id])
    redirect_to post_comments_path(post)
  end
  
  def edit
  end
  
  def delete
  end

end

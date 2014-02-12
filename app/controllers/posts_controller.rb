class PostsController < ApplicationController
  def index
  	@posts = Post.all
  end

  def show
  	@post = Post.find(params[:id])
  end


  def create
  	post = Post.create(params[:post].permit(:link, :body))

  	redirect_to post_path(post)
  end

end

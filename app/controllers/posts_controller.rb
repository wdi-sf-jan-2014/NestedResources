class PostsController < ApplicationController
  def index
  	@posts = Post.all
  end

  def show
  	@post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end


  def create
    # binding.pry
  	post = Post.create(params[:post].permit(:link, :body))
    post.comments.create(params[:comment].permit(:body)) unless params[:comment][:body].blank?
  	redirect_to post_path(post)
  end

end

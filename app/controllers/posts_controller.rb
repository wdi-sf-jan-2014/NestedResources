class PostsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show] do

    flash[:notice] = 'You dont have enough permissions to be here'
  end

  def index
  	@posts = Post.all()
  	
  end

  def show
  	@post = Post.find(params[:id])
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.create(params.require(:post).permit(:link, :body))
    @post.user = current_user
    @post.save
    LinksWorker.perform_async(@post, @post.link)

    if @post.http_response > 400
      flash[:notice] = 'Invalid Link'
      @post.destroy
      redirect_to root_path, :notice => "Sorry, that link is invalid." 
    end

  	redirect_to post_path(@post)
  end

  def destroy
  	post = Post.find(params[:id])
    post.comments.each do |comment|
      comment.destroy
    end
  	post.destroy
  	redirect_to root_path
  end

end

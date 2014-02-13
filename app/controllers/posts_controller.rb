class PostsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create]
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
  	post = current_user.posts.create(params[:post].permit(:link, :body))
    unless params[:comment][:body].blank?
      comment = post.comments.create(params[:comment].permit(:body)) 
      current_user.comments << comment
    end

    LinkWorker.perform_async(post.id)

  	redirect_to "/"
  end

end

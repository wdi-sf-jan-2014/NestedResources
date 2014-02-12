class PostsController < ApplicationController
  def index
  end

  # GET, start of creating a new Post (obtain attributes)
  def new
  	@post = Post.new
  end

  # POST, finalize the creation of new Post (persist attributes)
  def create
  	post = Post.create(params[:post].permit(:body, :link))
  	redirect_to '/'
  end

  def show
  end
end

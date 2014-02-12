class PostsController < ApplicationController
 
 	# GET, list of posts
  def index
  	@posts = Post.all
  end

  # GET, start of creating a new Post (obtain attributes)
  def new
  	@post = Post.new
  end

  # POST, finalize the creation of new Post (persist attributes)
  def create
  	post = Post.create(params[:post].permit(:body, :link))
  	redirect_to post
  end

  # POST (per rake routes), display post based on passed in post id
  def show
  	@post = Post.find(params[:id])
  end

end

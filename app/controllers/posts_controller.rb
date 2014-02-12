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
  	# collects nested attributes, for post & comment, from params
  	# new_post = params[:post].permit!  # ! permits the entire hash of values (TODO: be more granular with security)
  	new_post = params[:post].permit(:body, :link)

  	# SJM TODO - need to correct syntax/format of nested hash, with rockets is rejected by create
  	# currently won't save comment

  	# persits nested attributes for post & comment
  	post = Post.create(new_post)
  	redirect_to post
  end

  # POST (per rake routes), display post based on passed in post id
  def show
  	@post = Post.find(params[:id])
  end

end

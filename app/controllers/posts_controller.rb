class PostsController < ApplicationController
	before_filter :authenticate_user!, only: [:create, :new, :edit, :update]
  def index
  	@posts = Post.all.sort
  end

  def new
  	@post = Post.new
  end

  def create
  	post = Post.create(params[:post].permit(:link,:body, :comments_attributes=>[:body]))

    
    post2 = Post.find(post.id)
    link = post2.link
      #uri = URI.parse(link)
      #if uri.scheme != "http"
      # link = "http://"+link
      #end
    response = Typhoeus.get(link)
    binding.pry
    if response.response_code > 399 || response.response_code == 0
          post2.destroy
    end

    #LinksWorker.perform_async(post.id)
  	redirect_to post_path(post)
  end

  def show
  	@post = Post.find(params[:id])
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def update
  	post = Post.find(params[:id])
  	new_params = params[:post].permit(:link,:body, :comments_attributes=>[:body])
  	post.update_attributes(new_params)
  	redirect_to post_path(post)
  end

end

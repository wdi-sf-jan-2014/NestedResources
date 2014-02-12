class PostsController < ApplicationController
	before_filter :authenticate_user!, only: [:create, :new, :edit, :update]
  def index
  	@posts = Post.all
  end

  def new
  	@post = Post.new
  end

  def create
  	post = Post.create(params[:post].permit(:link,:body))
  	redirect_to post_path(post)
  end

  def show
  	@post = Post.find(params[:id])
  end
end

class PostsController < ApplicationController
  
  before_action :authenticate_user!, :except => [:index, :show]
  before_action :user_signed_in?, only: [:create, :new, :edit, :update, :destroy]


  def index
    @posts = Post.all
  end

  def show
   @post = Post.find(params[:id])
  end

  def new
  	@post = Post.new
  	@user = current_user
  end

  def create


  end

  def edit
  end

  def update
  end

  def destroy
  end

end

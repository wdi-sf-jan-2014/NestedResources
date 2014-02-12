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
   p = params.require(:post).permit(:link, :body)
   u = current_user
   new_p = Post.create(p)

   redirect_to post_path(new_p)

  end

  def edit
  end

  def update
  end

  def destroy
  end

end

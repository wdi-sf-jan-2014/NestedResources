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
    unless new_p.id
      flash[:notice] = "Dude, a post can't be blank!"
      redirect_to new_post_path
    else
      redirect_to post_path(new_p)
    end
   # end


  end

  def edit
  end

  def update
  end

  def destroy
  end

end

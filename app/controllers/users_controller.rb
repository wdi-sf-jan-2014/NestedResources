class UsersController < ApplicationController

  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end

  def index
  	@user = User.all

  end

  def new
  	@user = User.new
  end

  def create
  	# raise params.inspect
  	user = User.create(params[:user].permit(:email, :posts_attributes=>[:link, :body]))
  	redirect_to user
  end
end

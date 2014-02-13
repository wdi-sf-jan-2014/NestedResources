class UsersController < ApplicationController
  def new
    @user = user.new
  end

  def create
  end

  def show
    @user = current_user
    @posts = current_user.posts

    unless @user = User.find(params[:id])
      flash[:error] = "that's not you!"
      redirect_to root_path
    end
  end
end

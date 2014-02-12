class PostsController < ApplicationController
  
  before_filter :authenticate_user! 
  before_filter :user_signed_in?, only: [:create, :new, :edit, :update, :destroy]


  def index
  end

  def show

  end

  def new
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

class PostsController < ApplicationController
   def index
    @post = Post.all
  	if user_signed_in?
  	 render :index
  	else
  	redirect_to new_user_session_path
  end
end

  def create
    post = Post.create(params[:post].permit(:body))
    redirect_to root_path
  end

  def new
    @post = Post.new
  end

  def edit
    id = params[:id]
    @post = Post.find(id)
  end

  def show
    id = params[:id]
    @post = Post.find(id)
  end

  def update
    id = params[:id]
    update_post = params[:post].permit(:body)
    post = Post.find(id)
    post.update_attributes(update_post)
    redirect_to post_path(id)
  end

  def destroy
  end
end

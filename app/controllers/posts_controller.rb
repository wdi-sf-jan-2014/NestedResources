class PostsController < ApplicationController
  
  def index
  	@posts = Post.all
  end

  def new
  	@post = Post.new
  end

  def create
  	new_post = current_user.posts.create(post_params)
  	redirect_to post_path(new_post)
  end

  def show
  	@post = Post.find(params[:id])
  	@comments = @post.comments
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def update
  	updated_post = Post.find(params[:id])
  	updated_post.update(post_params)
  	redirect_to post_path(updated_post)
  end

  def destroy
  	Post.find(params[:id]).destroy
  	redirect_to posts_path
  end

  private

  def post_params
  	params.require(:post).permit(:name, :body, :link)
  end


end

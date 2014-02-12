class PostsController < ApplicationController
  def index
  	@posts = Post.all
  end

  def create
  	@user = User.find(current_user.id)
  	@post = @user.posts.create(post_parameters)
  	redirect_to root_path
  end

  def new
  	@user = User.find(params[:user_id])
  	@post = @user.posts.new
	end

	def edit
		@user = User.find(current_user.id)
		@post = @user.posts.find(params[:id])
end

	def update
		@user = User.find(current_user.id)
		@post = @user.posts.find(params[:id])
		@post.update(post_parameters)
		redirect_to root_path
	end

	def destroy
		@user = User.find(current_user.id)
		@post = @user.posts.find(params[:id])
		@post.delete
		redirect_to root_path
	end

	def show
		@user = User.find(params[:user_id])
		@post = @user.posts.find(params[:id])
		@post_id = params[:post_id]
	end

	private
	def post_parameters
    params.require(:post).permit(:link, :body)
  end
end

class PostsController < ApplicationController
  def index
  	@posts = Post.all(:order => 'id DESC')
  end

	def new
		@post = Post.new
	end

	def create
		post = Post.create(params[:post].permit(:body, :link, :comments_attributes=>[:body]))
		redirect_to posts_path
	end

	def edit
	end

	def show
		post = Post.find(params[:id])
		redirect_to post_comments_path(post)
	end

	def delete
		post = Post.find(params[:id])
		post.destroy
		redirect_to posts_path
	end

end


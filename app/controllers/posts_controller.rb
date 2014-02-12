class PostsController < ApplicationController
  def index
  	@posts = Post.all
  end


	def new

		@post = Post.new

	end

	def create

		post = Post.create(params[:post].permit(:body, :comments_attributes=>[:body]))

		redirect_to posts_path

	end

	def edit

	end
	def show
		# raise params.inspect
		post = Post.find(params[:id])

		redirect_to post_comments_path(post)
		
	end
	def delete

	end
end


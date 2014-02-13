class PostsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create]

  def index
  	@posts = Post.all
  end

  def new
  	@post = Post.new
  end

  def show
  	@post = Post.find(params[:id])
  end

  def create
  	post = current_user.posts.create(params[:post].permit(:link, :body))
  	unless params[:comment][:comment_body].blank?
  		new_comment = params.require(:comment).permit(:comment_body)	
			comment = post.comments.create(new_comment)
			current_user.comments << comment
		end
  	redirect_to post_path(post)
  end
end

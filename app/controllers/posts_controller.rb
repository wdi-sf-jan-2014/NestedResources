class PostsController < ApplicationController

  def index
  	@post = Post.new
  	@posts = Post.all.order(created_at: :desc).limit(5)
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def create
    post = Post.create(get_post_params)
    redirect_to post_path(post)  
  end

  def edit
  end
  
  def update
  end
  
  def destroy
  end

  private
  def get_post_params
    params.require(:post)
          .permit(:body, :link, :comments_attributes => [:body])
  end

end

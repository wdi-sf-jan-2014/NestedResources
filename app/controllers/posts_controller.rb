class PostsController < ApplicationController
  before_filter :authenticate_user!

  def index
	  @post = current_user.posts.new
  	@posts = Post.all.order(created_at: :desc).limit(5)
  end

  def show
    @post = current_user.posts.find(params[:id])
    @comments = @post.comments
    @new_comment = current_user.posts.new
  end
  
  def create
    post = current_user.posts.create(get_post_params)  
    post.comments.first.update_attributes(post_id: post.id, user_id: current_user.id)
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
          .permit(:body, :link, comments_attributes: [ :body ])
  end

end

class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def  new
    if user_signed_in?
        @post = current_user.posts.new
    else
        redirect_to new_user_session_path
    end
  end

  def create
    if user_signed_in?
        post = current_user.posts.create(post_params)
        PostLinkWorker.perform_async(post.id)
        redirect_to post
        
    else
        redirect_to new_user_session_path
    end
  end

  def show
    redirect_to post_comments_path post_id
  end

  private

  def post_params
    params.require(:post).permit(:body, :link)
  end

  def post_id
    params[:id]
  end

end

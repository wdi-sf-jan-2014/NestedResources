class PostsController < ApplicationController
  def index
  	@posts = Post.all(:order => 'id DESC')
  end

  def new
  	@post = Post.new
  end

  def create
  	post = current_user.posts.create(params.require(:post).permit(:body, :link, :comments_attributes=>[:body]))
    # LinksWorker.perform_async(post.id)
  	redirect_to post
  end

  def show
  	@post = Post.find(params[:id])
  	@comments = @post.comments
    
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def update
  	updated_post = params.require(:post).permit(:body, :link)
  	post = Post.find(params[:id])
  	post.update_attributes(updated_post)
  	redirect_to post
  end

  def destroy
  	post = Post.find(params[:id])
  	post.destroy
  	redirect_to '/posts'
  end

end

class PostsController < ApplicationController
  def index
    @posts = current_user.posts.all
  end

  def new
    @posts = current_user.posts.new
  end

  def create
    post_params = params.require(:posts).permit(:title, :body)
    @posts = current_user.posts.new(post_params)

    if @posts.save
      redirect_to @posts, notice: "Post created sucessfully"
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
  end

end

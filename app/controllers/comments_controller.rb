class CommentsController < ApplicationController
  
  before_action :authenticate_user!, :except => [:index, :show]
  before_action :user_signed_in?, only: [:create, :new, :edit, :update, :destroy]

  def index
  	@post = Post.find(params[:post_id])
  	@comments = @post.comments.all
  end

  def new
  	@post = Post.find(params[:post_id])
  	@comment = @post.comments.build
  end

  def create
    post = Post.find(params[:post_id])
    new_comment = params.require(:comment).permit(:comment)
    user = current_user
    comment = post.comments.create(new_comment)

    redirect_to post_path(post)   

  end

  def show
  end

  def edit
  end

  def update
  end
end

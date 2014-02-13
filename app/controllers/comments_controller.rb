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
    c = params.require(:comment).permit(:comment)
    new_c = post.comments.create(c)

    unless new_c.id
      flash[:notice] = "Dude, a comment can't be blank!"
      redirect_to new_post_comment_path
    else
      redirect_to post_path(post)
    end
  end

  def show
  end

  def edit
  end

  def update
  end
end

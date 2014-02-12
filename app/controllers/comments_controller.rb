class CommentsController < ApplicationController
	before_filter :authenticate_user!

def index
  @post = Post.find(params[:post_id])
end

def show
	@post = Post.find(params[:post_id])
	@comment = @post.comments.find(params[:id])

end

def new
	@post = Post.find(params[:post_id])
	@comment = @post.comments.build
end

def create
	new_comment = params.require(:comment).permit(:body)
	post = Post.find(params[:post_id])
	comment = post.comments.create(new_comment)
	redirect_to post_comment_path(post,comment)
end

def delete
end


end

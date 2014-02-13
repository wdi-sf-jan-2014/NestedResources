class CommentsController < ApplicationController
	before_filter :authenticate_user!, only: [:new, :create, :comment_create]
	
	def show
		@post = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])
	end

	def create
		post = Post.find(params[:post_id])
		comment = post.comments.create(params[:comment].permit(:comment_body))
		current_user.comments << comment
		redirect_to post_path(post)
	end

	def comment_create
		comment = Comment.find(params[:id])
		new_comment = comment.comments.create(params[:comment].permit(:comment_body))
		current_user.comments << new_comment
		redirect_to "/posts/#{params[:post_id]}/comments/#{comment.id}"
	end

end

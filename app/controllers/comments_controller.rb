class CommentsController < ApplicationController
	before_filter :authenticate_user!, only: [:new, :create]
	
	def create
		post = Post.find(params[:post_id])
		comment = post.comments.create(params[:comment].permit(:comment_body))
		current_user.comments << comment
		redirect_to post_path(post)
	end

end

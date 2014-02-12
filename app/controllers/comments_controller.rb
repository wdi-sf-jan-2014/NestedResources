class CommentsController < ApplicationController
	before_filter :authenticate_user!?
	def create
		post = Post.find(params[:post_id])
		post.comments.create(params[:comment].permit(:body))

		redirect_to post_path(post)
	end
end

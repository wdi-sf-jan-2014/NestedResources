class CommentsController < ApplicationController

	
	def index
		@post= Post.find(params[:post_id])
	end
	
	def new
		@post= Post.find(params[:post_id])
	end
	
	def create
		@post= Post.find(params[:post_id])
		new_comment = params.require(:comment).permit(:commentbody)
		@comment=@post.comments.create(new_comment)
		redirect_to post_comment_path(@post, @comment)
	end
	
	def show
		@post=Post.find(params[:post_id])
		@comment=@post.comments.find(params[:id])
	end
	
	def edit
		@post= Post.find(params[:post_id])
		@comment=@post.comments.find(params[:id])
	end

	def update
		@post= Post.find(params[:post_id])
		new_comment = params.require(:comment).permit(:commentbody)
		comment=@post.comments.find(params[:id]).update_attributes(new_comment)
		redirect_to post_comment_path
	end
	
	def destroy
		@auction=Auction.find(params[:auction_id])
		bid=@auction.bids.find(params[:id])
		bid.destroy
		redirect_to auction_bids_path
	end


end

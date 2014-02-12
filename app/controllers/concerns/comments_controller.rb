class CommentsController < ApplicationController

	def index
		@post = Post.find(params[:post_id])
		# @highest_bid = Auction.find(params[:auction_id]).bids.maximum('amount')
	end
	def show
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
	end

	def new
		@post = Post.find(params[:post_id])
		@comment = @post.comments.new
	end

	def create
		new_comment = params[:comment].permit(:body)
		post = Post.find(params[:post_id])
		comment = post.comments.create(new_comment)
		redirect_to post_comment_path(post, comment)
	end

	def edit
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
	end

	def update
		# edit_bid = params[:bid].permit(:amount)
		# auction = Auction.find(params[:auction_id])
		# bid = auction.bids.find(params[:id])
		# bid.update_attributes(edit_bid)

		# # redirect_to auction_bid_path
		# # below link also works
		# redirect_to [auction, bid]
	end


	def delete
		# @auction = Auction.find(params[:auction_id])
	end


end
class CommentsController < ApplicationController
  before_filter :authenticate_user!
  def show
    @comment = Comment.find(params[:id])
  end

  def new
  	id = params[:comment_id]
  	@comment = Comment.find(id)
end
end

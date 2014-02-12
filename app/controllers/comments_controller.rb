class CommentsController < ApplicationController
  before_filter :authenticate_user!
  def show
    @comment = Comment.find(params[:id])
  end
end

class CommentsController < ApplicationController
  before_filter :authenticate_user!
  def show
    @comment = Comment.find(params[:id])
  end

  def new
  	id = params[:comment_id]
  	@comment = Comment.find(id)
end

  def create
  	id = params[:comment_id]
  	comment = Comement.find(id)
  	creating = params[:comments].require(#:comments)
  	comment.create(creating)
  	redirect_to something_something_path
end

end


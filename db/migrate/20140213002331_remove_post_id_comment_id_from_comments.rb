class RemovePostIdCommentIdFromComments < ActiveRecord::Migration
  def change
    remove_reference :comments, :post
    remove_reference :comments,  :comment
  end
end

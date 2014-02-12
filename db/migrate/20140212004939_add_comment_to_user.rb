class AddCommentToUser < ActiveRecord::Migration
  def change
    add_reference :users, :comments, index: true
  end
end

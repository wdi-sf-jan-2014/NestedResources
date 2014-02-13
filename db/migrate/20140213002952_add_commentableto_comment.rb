class AddCommentabletoComment < ActiveRecord::Migration
  def change
    add_reference :comments, :commentable, {polymorphic: true}
    add_index :comments, [:commentable_id, :commentable_type]
  end
end

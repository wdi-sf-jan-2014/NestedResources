class AddCommentableToComments < ActiveRecord::Migration
  def self.up
    change_table :comments do |t|
      t.references :commentable, polymorphic: true
    end
    add_index :comments, [:commentable_id, :commentable_type]
  end
end
class AddPostToUser < ActiveRecord::Migration
  def change
    add_reference :users, :posts, index: true
  end
end

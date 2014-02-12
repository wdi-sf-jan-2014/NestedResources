class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :link
      t.text :body
      t.integer :user_id

      t.timestamps
    end
  end
end

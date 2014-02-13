class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :link
      t.text :body
      t.references :user

      t.timestamps
    end
  end
end

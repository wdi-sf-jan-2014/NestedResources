class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :link
      t.text :body
      t.references :user, index: true

      t.timestamps
    end
  end
end
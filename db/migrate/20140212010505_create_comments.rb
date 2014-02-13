class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :post_id
      t.integer :user_id
      t.integer :commentable_id
      t.string  :commentable_type
      t.text :commentbody

      t.timestamps
    end
  end
end

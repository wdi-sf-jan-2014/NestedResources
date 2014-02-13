class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment_body

      t.timestamps
      t.belongs_to :commentable, polymorphic: true
    end
    add_index :comments, [:commentable_id, :commentable_type]
  end
end

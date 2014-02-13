class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      t.references :post, index: true
      t.references :user, index: true
      t.belongs_to :commentable, polymorphic: true

      t.timestamps
    end
    	add_index :comments, [:commentable_id, :commentable_type]
  end
end

class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :say
      t.timestamps
    end
    add_index :comments, [:commentable_id, :commentable_type]
  end
end

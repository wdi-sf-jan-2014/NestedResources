class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      t.references :user, index: true
      t.references :post, index: true
      t.references :commentable, polymorphic: true

      t.timestamps
    end
  end
end

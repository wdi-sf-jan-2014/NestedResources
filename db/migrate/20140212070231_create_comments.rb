class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      t.references :user, index: true
      t.belongs_to :commentable, polymorphic: true

      t.timestamps
    end
  end
end

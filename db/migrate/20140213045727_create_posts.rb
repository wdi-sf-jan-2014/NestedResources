class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :link
      t.string :body
      t.belongs_to :postable, polymorphic:true
      
      t.timestamps
    end
  end
end

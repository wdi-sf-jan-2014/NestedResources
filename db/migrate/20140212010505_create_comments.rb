class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :imageable_id
      t.string  :imageable_type
      t.text :commentbody

      t.timestamps
    end
  end
end

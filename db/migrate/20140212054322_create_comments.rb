class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :say

      t.timestamps
    end
  end
end

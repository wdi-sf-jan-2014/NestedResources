class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commentbody

      t.timestamps
    end
  end
end

class AddCounterToComments < ActiveRecord::Migration
  def change
    add_column :comments, :counter, :integer
  end
end

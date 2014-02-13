class CreateNestedResourcesDevs < ActiveRecord::Migration
  def change
    create_table :nested_resources_devs do |t|

      t.timestamps
    end
  end
end

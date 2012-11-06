class ResourcesScale < ActiveRecord::Migration
  def change
    create_table :resources_scales, :id => false do |t|
      t.integer :scale_id
      t.integer :resource_id
    end
    add_index :resources_scales, :scale_id
    add_index :resources_scales, :resource_id
  end
end

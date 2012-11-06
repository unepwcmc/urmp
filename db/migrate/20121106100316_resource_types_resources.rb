class ResourceTypesResources < ActiveRecord::Migration
  def change
    create_table :resource_types_resources, :id => false do |t|
      t.integer :resource_types_id
      t.integer :resource_id
    end
    add_index :resource_types_resources, :resource_types_id
    add_index :resource_types_resources, :resource_id
  end
end

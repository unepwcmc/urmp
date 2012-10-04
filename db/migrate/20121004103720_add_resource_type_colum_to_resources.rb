class AddResourceTypeColumToResources < ActiveRecord::Migration
  def change
    add_column :resources, :resource_type, :string
    remove_column :resources, :resource_type_id
    drop_table :resource_types
  end
end

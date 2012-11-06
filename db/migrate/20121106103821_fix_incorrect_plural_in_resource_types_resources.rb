class FixIncorrectPluralInResourceTypesResources < ActiveRecord::Migration
  def change
    remove_index :resource_types_resources, :resource_types_id
    remove_column :resource_types_resources, :resource_types_id
    add_column :resource_types_resources, :resource_type_id, :integer
    add_index :resource_types_resources, :resource_type_id
  end
end

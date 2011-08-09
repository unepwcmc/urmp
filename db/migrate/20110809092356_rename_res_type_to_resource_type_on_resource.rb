class RenameResTypeToResourceTypeOnResource < ActiveRecord::Migration
  def self.up
    rename_column :resources, :res_type_id, :resource_type_id
  end

  def self.down
    rename_column :table, :resource_type_id, :res_type_id
  end
end

class RemoveOldResourceTypeField < ActiveRecord::Migration
  def change
    remove_column :resources, :resource_type
  end
end

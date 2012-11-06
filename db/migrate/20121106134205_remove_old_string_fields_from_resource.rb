class RemoveOldStringFieldsFromResource < ActiveRecord::Migration
  def change
    remove_column :resources, :theme
    remove_column :resources, :language
  end
end

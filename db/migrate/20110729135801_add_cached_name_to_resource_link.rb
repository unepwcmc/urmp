class AddCachedNameToResourceLink < ActiveRecord::Migration
  def self.up
    add_column :resource_links, :cached_name, :text
  end

  def self.down
    remove_column :resource_links, :cached_name
  end
end

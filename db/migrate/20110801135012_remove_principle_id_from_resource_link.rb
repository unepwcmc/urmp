class RemovePrincipleIdFromResourceLink < ActiveRecord::Migration
  def self.up
    remove_column :resource_links, :principle_id
  end

  def self.down
    add_column :resource_links, :principle_id, :integer
  end
end

class AddNumericReferenceToResourceLink < ActiveRecord::Migration
  def self.up
    add_column :resource_links, :numeric_reference, :text
  end

  def self.down
    remove_column :resource_links, :numeric_reference
  end
end

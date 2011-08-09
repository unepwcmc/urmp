class ChangeResourceLinkToText < ActiveRecord::Migration
  def self.up
    change_column :resources, :link, :text
  end

  def self.down
    change_column :resources, :link, :string
  end
end

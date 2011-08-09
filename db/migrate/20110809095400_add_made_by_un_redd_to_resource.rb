class AddMadeByUnReddToResource < ActiveRecord::Migration
  def self.up
    add_column :resources, :made_by_un_redd, :boolean
  end

  def self.down
    remove_column :resources, :made_by_un_redd
  end
end

class ChangeResourceDateToAString < ActiveRecord::Migration
  def self.up
    change_column :resources, :resource_date, :string
  end

  def self.down
    change_column :resources, :resource_date, :date
  end
end

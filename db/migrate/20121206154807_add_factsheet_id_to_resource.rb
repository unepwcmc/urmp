class AddFactsheetIdToResource < ActiveRecord::Migration
  def change
    add_column :resources, :factsheet_id, :integer
  end
end

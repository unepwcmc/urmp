class AddFactsheetTable < ActiveRecord::Migration
  def change
    create_table :factsheets do |t|
      t.string :name
      t.integer :resource_id, :null => false
      t.attachment :attachment
    end
    add_index :factsheets, :resource_id
  end
end

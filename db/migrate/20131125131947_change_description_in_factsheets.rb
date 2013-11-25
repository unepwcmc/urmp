class ChangeDescriptionInFactsheets < ActiveRecord::Migration
  def up
    change_column :factsheets, :description, :string
  end

  def down
    change_column :factsheets, :description, :text    
  end
end

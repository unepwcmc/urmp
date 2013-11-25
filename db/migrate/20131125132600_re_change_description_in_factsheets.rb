class ReChangeDescriptionInFactsheets < ActiveRecord::Migration
  def up
    change_column :factsheets, :description, :text
  end

  def down
    change_column :factsheets, :description, :string
  end
end

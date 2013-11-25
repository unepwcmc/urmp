class AddDescriptionToFactsheets < ActiveRecord::Migration
  def change
    add_column :factsheets, :description, :string
  end
end

class ChangeRailsHistoryToText < ActiveRecord::Migration
  def change
    change_column :rails_admin_histories, :message, :text
  end
end

class RemoveActivityStringFromResource < ActiveRecord::Migration
  def change
    remove_column :resources, :activity
  end
end

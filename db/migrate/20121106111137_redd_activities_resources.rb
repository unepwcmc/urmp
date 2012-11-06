class ReddActivitiesResources < ActiveRecord::Migration
  def change
    create_table :redd_activities_resources, :id => false do |t|
      t.integer :redd_activity_id
      t.integer :resource_id
    end
    add_index :redd_activities_resources, :redd_activity_id
    add_index :redd_activities_resources, :resource_id
  end
end

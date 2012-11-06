class RenameTopicsResourcesToResourcesTopics < ActiveRecord::Migration
  def change
    rename_table :topics_resources, :resources_topics
  end
end

class ResourcesTopics < ActiveRecord::Migration
  def change
    create_table :topics_resources, :id => false do |t|
      t.integer :topic_id
      t.integer :resource_id
    end
    add_index :topics_resources, :topic_id
    add_index :topics_resources, :resource_id
  end
end

class AddRelevanceToResource < ActiveRecord::Migration
  def change
    add_column :resources, :relevance, :text
  end
end

class AddPrincipleTranslationsTable < ActiveRecord::Migration
  def self.up
    Principle.create_translation_table! :description => :text
  end

  def self.down
    Principle.drop_translation_table!
  end
end

class AddCriterionTranslationsTable < ActiveRecord::Migration
  def self.up
    Criterion.create_translation_table! :description => :text
  end

  def self.down
    Criterion.drop_translation_table!
  end
end

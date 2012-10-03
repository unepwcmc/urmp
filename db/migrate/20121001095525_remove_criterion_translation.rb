class RemoveCriterionTranslation < ActiveRecord::Migration
  def self.up
    drop_table :criterion_translations
    add_column :criteria, :description, :text
  end

  def self.down
    Criterion.create_translation_table! :description => :text
  end
end

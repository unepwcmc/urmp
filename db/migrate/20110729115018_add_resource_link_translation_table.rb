class AddResourceLinkTranslationTable < ActiveRecord::Migration
  def self.up
    ResourceLink.create_translation_table! :reference => :text
  end

  def self.down
    ResourceLink.drop_translation_table!
  end
end

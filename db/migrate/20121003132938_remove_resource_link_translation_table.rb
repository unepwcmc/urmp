class RemoveResourceLinkTranslationTable < ActiveRecord::Migration
  def up
    drop_table :resource_link_translations
  end

  def down
  end
end

class AddCachedNameToCriterionTranslation < ActiveRecord::Migration
  def self.up
    add_column :criterion_translations, :cached_name, :string
  end

  def self.down
    remove_column :criterion_translations, :cached_name, :string
  end
end

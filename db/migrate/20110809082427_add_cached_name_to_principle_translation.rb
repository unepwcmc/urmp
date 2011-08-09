class AddCachedNameToPrincipleTranslation < ActiveRecord::Migration
  def self.up
    add_column :principle_translations, :cached_name, :string
  end

  def self.down
    remove_column :principle_translations, :cached_name, :string
  end
end

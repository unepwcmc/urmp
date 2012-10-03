class RemovePrincipleTranslations < ActiveRecord::Migration
  def up
    drop_table :principle_translations
    add_column :principles, :description, :text
  end

  def down
    raise 'NoWayBack'
  end
end

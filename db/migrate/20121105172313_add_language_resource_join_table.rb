class AddLanguageResourceJoinTable < ActiveRecord::Migration
  def change
    create_table :languages_resources, :id => false do |t|
      t.integer :language_id
      t.integer :resource_id
    end
    add_index :languages_resources, :language_id
    add_index :languages_resources, :resource_id
  end
end

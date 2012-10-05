class AddMissingResourceAttributes < ActiveRecord::Migration
  def up
    add_column :resources, :technical_expertise, :string
    add_column :resources, :audience, :string
    add_column :resources, :acitivity, :string
    add_column :resources, :country, :string
  end

  def down
    remove_column :resources, :technical_expertise
    remove_column :resources, :audience
    remove_column :resources, :acitivity
    remove_column :resources, :country
  end
end

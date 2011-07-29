class AddResourceFields < ActiveRecord::Migration
  def self.up
    rename_column :resources, :name, :title
    add_column :resources, :author, :string
    add_column :resources, :language, :string
    add_column :resources, :resource_date, :date
    add_column :resources, :institution, :string
    add_column :resources, :description, :text
    add_column :resources, :res_type_id, :integer
  end

  def self.down
    rename_column :resources, :title,  :name
    remove_column :resources, :author
    remove_column :resources, :language
    remove_column :resources, :resource_date
    remove_column :resources, :institution
    remove_column :resources, :description
    remove_column :resources, :res_type_id
  end
end

class CountriesResources < ActiveRecord::Migration
  def change
    create_table :countries_resources, :id => false do |t|
      t.integer :country_id
      t.integer :resource_id
    end
    add_index :countries_resources, :country_id
    add_index :countries_resources, :resource_id
  end
end

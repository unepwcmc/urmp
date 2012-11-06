class RemoveCountryStringFromResources < ActiveRecord::Migration
  def change
    remove_column :resources, :country
  end
end

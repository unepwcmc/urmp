class AddNameColumnToCriteria < ActiveRecord::Migration
  def change
    add_column :criteria, :name, :string
  end
end

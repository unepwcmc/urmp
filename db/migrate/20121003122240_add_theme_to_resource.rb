class AddThemeToResource < ActiveRecord::Migration
  def change
    add_column :resources, :theme, :string
  end
end

class ChangeResourceAuthorTypeToText < ActiveRecord::Migration
  def up
    change_column :resources, :author, :text
  end

  def down
    change_column :resources, :author, :string
  end
end

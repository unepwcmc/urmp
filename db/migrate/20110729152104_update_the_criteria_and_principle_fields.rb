class UpdateTheCriteriaAndPrincipleFields < ActiveRecord::Migration
  def self.up
    remove_column :principles, :name
    remove_column :criteria, :name

    add_column :principles, :number, :integer
    add_column :criteria, :number, :integer
  end

  def self.down
    add_column :principles, :name, :string
    add_column :criteria, :name, :string

    remove_column :principles, :number
    remove_column :criteria, :number
  end
end

class AddNameColumnToPrinciples < ActiveRecord::Migration
  def change
    add_column :principles, :name, :string
  end
end

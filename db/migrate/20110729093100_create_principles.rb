class CreatePrinciples < ActiveRecord::Migration
  def self.up
    create_table :principles do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :principles
  end
end

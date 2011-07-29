class CreateCriteria < ActiveRecord::Migration
  def self.up
    create_table :criteria do |t|
      t.string :name
      t.integer :principle_id

      t.timestamps
    end
  end

  def self.down
    drop_table :criteria
  end
end

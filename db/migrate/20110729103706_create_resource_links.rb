class CreateResourceLinks < ActiveRecord::Migration
  def self.up
    create_table :resource_links do |t|
      t.text :reference
      t.integer :principle_id
      t.integer :criterion_id
      t.integer :resource_id

      t.timestamps
    end
  end

  def self.down
    drop_table :resource_links
  end
end

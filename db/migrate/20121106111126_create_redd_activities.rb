class CreateReddActivities < ActiveRecord::Migration
  def change
    create_table :redd_activities do |t|
      t.string :name

      t.timestamps
    end
  end
end

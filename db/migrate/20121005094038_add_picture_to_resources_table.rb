class AddPictureToResourcesTable < ActiveRecord::Migration
  def change
    add_attachment :resources, :picture
  end
end

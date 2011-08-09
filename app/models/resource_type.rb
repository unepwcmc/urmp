class ResourceType < ActiveRecord::Base
  validates_presence_of :name
  has_many :resources

  rails_admin do
    visible :false
  end
end

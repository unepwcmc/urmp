class ResourceLink < ActiveRecord::Base
  belongs_to :resource
  belongs_to :principle
  belongs_to :criterion

  validates_presence_of :resource
end

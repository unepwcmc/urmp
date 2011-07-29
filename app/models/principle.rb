class Principle < ActiveRecord::Base
  has_many :criteria
  has_many :resource_links
  has_many :resources, :through => :resource_links

  validates_presence_of :name
end

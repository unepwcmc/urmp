class Resource < ActiveRecord::Base
  has_many :resource_links
  has_many :criteria, :through => :resource_links
  has_many :principles, :through => :resource_links
end

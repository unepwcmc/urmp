class Resource < ActiveRecord::Base
  has_many :resource_links
  belongs_to :resource_type
  has_many :criteria, :through => :resource_links

  validates_presence_of :resource_type

  rails_admin do
  end
end

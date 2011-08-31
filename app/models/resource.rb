class Resource < ActiveRecord::Base
  has_many :resource_links
  belongs_to :resource_type
  has_many :criteria, :through => :resource_links

  rails_admin do
  end
end

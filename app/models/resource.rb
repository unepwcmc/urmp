class Resource < ActiveRecord::Base

  THEMES = ['impacts', 'identification'].freeze

  has_many :resource_links
  belongs_to :resource_type
  has_many :criteria, :through => :resource_links

  validates :theme, :presence => true

  rails_admin do
  end
end

class Resource < ActiveRecord::Base

  THEMES = ['impacts', 'identification'].freeze
  TYPES = {
    'tool' => 'Tool',
    'guidance' => 'Guidance',
    'information_material' => 'Information material'
  }

  has_many :resource_links
  has_many :criteria, :through => :resource_links
  has_one :factsheet

  validates :theme, :presence => true
  validates :resource_type, :presence => true

  rails_admin do
  end
end

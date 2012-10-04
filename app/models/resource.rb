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

  validates :theme, :inclusion => { :in => THEMES }, :allow_nil => true
  validates :resource_type, :inclusion => {:in => TYPES.keys }, :allow_nil => true
end

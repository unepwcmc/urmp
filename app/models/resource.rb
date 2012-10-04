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

  validates :theme, :inclusion => { :in => THEMES }
  validates :resource_type, :presence => true, :inclusion => {:in => TYPES.keys }

  rails_admin do
  end
end

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
  has_attached_file :picture,
    :default_url => "/assets/default_:style_resource_picture.png",
    :styles => { :medium => "250x200>", :thumb => "150x150>" }

  validates :theme, :inclusion => { :in => THEMES }, :allow_nil => true
  validates :resource_type, :inclusion => {:in => TYPES.keys }, :allow_nil => true
  validates_attachment :picture,
    :content_type => { :content_type => /image/ }
end

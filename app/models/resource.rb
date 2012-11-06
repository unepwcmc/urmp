class Resource < ActiveRecord::Base
  THEMES = ['impacts', 'identification'].freeze

  has_many :resource_links
  has_many :criteria, :through => :resource_links
  has_one :factsheet

  has_and_belongs_to_many :languages
  has_and_belongs_to_many :resource_types

  has_attached_file :picture,
    :default_url => "/assets/default_:style_resource_picture.png",
    :styles => { :medium => "250x200>", :thumb => "150x150>" }

  validates :theme, :inclusion => { :in => THEMES }, :allow_nil => true
  validates :title, :presence => true
  validates_attachment :picture,
    :content_type => { :content_type => ["image/png", "image/jpg", "image/jpeg", "image/gif"] }

  attr_accessor :delete_picture
  before_validation { self.picture.clear if self.delete_picture == '1' }
end

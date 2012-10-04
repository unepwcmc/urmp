class Factsheet < ActiveRecord::Base
  has_attached_file :attachment
  belongs_to :resource

  validates_attachment :attachment, :presence => true,
    :content_type => { :content_type => "application/pdf" }

  validates :name, :presence => true
  validates :resource, :presence => true

  def self.grouped_by_resource_theme
    factsheets = includes(:resource)
    factsheets.group_by do |factsheet|
      factsheet.resource.theme
    end
  end
end

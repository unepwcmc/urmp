class Factsheet < ActiveRecord::Base
  has_attached_file :attachment
  belongs_to :resource

  validates_attachment :attachment, :presence => true,
    :content_type => { :content_type => "application/pdf" }

  validates :name, :presence => true
end

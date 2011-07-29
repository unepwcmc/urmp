class Principle < ActiveRecord::Base
  has_many :criteria
  has_many :resource_links
  has_many :resources, :through => :resource_links

  validates_presence_of :number

  translates :description

  rails_admin do
    object_label_method do
      :number
    end
  end
   
end

class Criterion < ActiveRecord::Base
  belongs_to :principle
  has_many :resource_links
  has_many :resources, :through => :resource_links

  validates_presence_of :principle, :number

  translates :description

  rails_admin do
    object_label_method do
      :number
    end
  end

end

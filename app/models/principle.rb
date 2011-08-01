class Principle < ActiveRecord::Base
  has_many :criteria
  has_many :resources, :through => :criteria

  has_many :principle_translations

  validates_presence_of :number

  translates :description

  rails_admin do
    object_label_method do
      :number
    end
  end
   
end

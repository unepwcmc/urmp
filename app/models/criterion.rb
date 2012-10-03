class Criterion < ActiveRecord::Base
  belongs_to :principle
  has_many :resource_links
  has_many :resources, :through => :resource_links

  validates_presence_of :principle, :number
  validates_uniqueness_of :number

  rails_admin do
    object_label_method do
      :number
    end
    list do
      field :number
      field :description
      field :principle
    end
    edit do
      field :number
      field :description
      field :principle
    end
  end

end

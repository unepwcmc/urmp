class Principle < ActiveRecord::Base
  has_many :criteria

  has_many :principle_translations

  validates_presence_of :number

  translates :description

  rails_admin do
    object_label_method do
      :number
    end
    weight -1
    list do
      field :number
      field :description
      field :principle_translations
    end
    edit do
      field :number
      field :description
      field :principle_translations
    end
  end
   
end

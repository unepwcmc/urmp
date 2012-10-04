class Principle < ActiveRecord::Base
  has_many :criteria
  validates_presence_of :name
  validates_presence_of :description
end

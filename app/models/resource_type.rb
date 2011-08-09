class ResourceType < ActiveRecord::Base
  validates_presence_of :name
  has_many :resources

=begin
  rails_admin do
  end
=end
end

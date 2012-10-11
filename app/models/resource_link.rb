class ResourceLink < ActiveRecord::Base
  belongs_to :resource
  belongs_to :criterion

  validates_presence_of :resource
  validates_presence_of :criterion

  before_save :store_cached_name

  # Store a cached name based on the links
  #
  # @return [String] the cached name
  def store_cached_name
    self.cached_name = ""
    self.cached_name << "#{reference} - " if reference.present?
    self.cached_name << "#{resource.title} - "
    self.cached_name << "#{criterion.name}"
  end

end

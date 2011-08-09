class ResourceLink < ActiveRecord::Base
  belongs_to :resource
  belongs_to :criterion

  validates_presence_of :resource
  validates_presence_of :criterion

  after_validation :store_cached_name

  rails_admin do
  end
   
  # Store a cached name based on the links
  #
  # @return [String] the cached name
  def store_cached_name
    self.cached_name = ""
    if reference.present?
      self.cached_name << "#{reference} - "
    end
    self.cached_name << "#{resource.title} - "
    self.cached_name << "criterion #{criterion.number}"
  end

end

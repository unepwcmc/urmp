class ResourceLink < ActiveRecord::Base
  belongs_to :resource
  belongs_to :criterion

  validates_presence_of :resource
  validates_presence_of :criterion

  has_many :resource_link_translations
  accepts_nested_attributes_for :resource_link_translations

  after_validation :store_cached_name

  rails_admin do
    object_label_method do
      :cached_name
    end
  end
   
  # Store a cached name based on the links
  #
  # @return [String] the cached name
  def store_cached_name
    cached_name = ""
    if reference.present?
      cached_name << "#{reference} - "
    end
    cached_name << "#{resource.title} - "
    cached_name << "#{criterion.number}"
  end

end

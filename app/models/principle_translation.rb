class PrincipleTranslation < ActiveRecord::Base
  belongs_to :principle
  validates_presence_of :principle
  validates_presence_of :locale

  after_validation :store_cached_name

  def locale_enum
    Urmp::Application::SITE_LOCALES
  end

  rails_admin do
    object_label_method do
      :locale
    end
    visible false
  end
  
  # Store a cached name based on the principle and text
  #
  # @return [String] the cached name
  def store_cached_name
    self.cached_name = "Principle #{principle.try(:number)}"
    self.cached_name << " - #{locale}"
    self.cached_name << " - #{description}"
  end

end


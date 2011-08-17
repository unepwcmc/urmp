class CriterionTranslation < ActiveRecord::Base
  belongs_to :criterion
  validates_presence_of :criterion
  validates_presence_of :locale

  after_validation :name

  def locale_enum
    Urmp::Application::SITE_LOCALES
  end

  rails_admin do
    object_label_method do
      :name
    end
    visible false
  end
  
  # Generates a name for the translation, puts it into the cached name field
  # Unfortunately, due to the fact that AR hooks aren't triggered by 
  # globalize3, we can't just store the cached_name on edits :-(
  #
  # @return [String] the cached name
  def name
    self.cached_name = "Criterion #{criterion.try(:number)}"
    self.cached_name << " - #{locale}"
    self.cached_name << " - #{description}"
  end
end


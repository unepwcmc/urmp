class CriterionTranslation < ActiveRecord::Base
  belongs_to :criterion

  def locale_enum
    Urmp::Application::SITE_LOCALES
  end

  rails_admin do
    object_label_method do
      :locale
    end
    visible false
  end
  
end


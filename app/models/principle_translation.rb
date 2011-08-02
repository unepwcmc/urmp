class PrincipleTranslation < ActiveRecord::Base
  belongs_to :principle

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


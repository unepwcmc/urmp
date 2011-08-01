class CriterionTranslation < ActiveRecord::Base
  belongs_to :criterion

  def locale_enum
    I18n.available_locales
  end

  rails_admin do
    object_label_method do
      :locale
    end
    visible false
  end
  
end


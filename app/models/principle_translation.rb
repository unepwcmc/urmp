class PrincipleTranslation < ActiveRecord::Base
  belongs_to :principle

  def locale_enum
    I18n.available_locales
  end

  rails_admin do
    object_label_method do
      :locale
    end
  end
  
end


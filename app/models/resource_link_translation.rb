class ResourceLinkTranslation < ActiveRecord::Base
  belongs_to :resource_link

  def locale_enum
    I18n.available_locales
  end

  rails_admin do
    object_label_method do
      :locale
    end
  end
  
end


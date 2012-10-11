module FactsheetsHelper
  def name_for_theme(theme)
    {
      'impacts' => t('site.factsheets.impacts_theme'),
      'identification' => t('site.factsheets.identification_theme'),
      nil => t('site.factsheets.no_theme')
    }[theme]
  end
end

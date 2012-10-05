module FactsheetsHelper
  def name_for_theme(theme)
    {
      'impacts' => 'Monitoring of REDD+ impacts of biodiversity and ecosystem services',
      'identification' => 'Identification, mapping, and valuation of biodiveristy and ecoxystem services',
      nil => 'All the rest'
    }[theme]
  end
end

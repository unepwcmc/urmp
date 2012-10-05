require 'selectable_fields'

class ResourceSearch
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  include URMP::SelectableFields

  SEARCH_ATTR = [:text, :theme, :activity, :resource_type, :technical_expertise, :country, :language]
  RESULTS_PER_PAGE = 10

  attr_accessor *SEARCH_ATTR
  attr_reader :page, :results_per_page

  selectable_fields [:language, :theme, :resource_type, :country, :topic]

  def initialize(attrs={}, page=1)
    @page = page
    @results_per_page = RESULTS_PER_PAGE

    attrs = attrs || {}
    SEARCH_ATTR.each do |attr|
      if val = (attrs[attr] || attrs[attr.to_s])
        instance_variable_set("@#{attr.to_s}", val)
      end
    end
  end

  def find
    @results = Resource.search(
      "title_or_description_contains" => text,
      "language_eq" => language,
      "resource_type_eq" => resource_type,
      "theme_eq" => theme,
      "country_eq" => country
    ).page(page).per(results_per_page)
  end

  def results
    @results
  end

  def persisted?
    false
  end
end

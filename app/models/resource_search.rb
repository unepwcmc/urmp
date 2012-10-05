require 'selectable_fields'

class ResourceSearch
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  include URMP::SelectableFields

  SEARCH_ATTR = [:text, :topic, :activity, :tool, :technical_expertise, :country, :language]

  attr_accessor *SEARCH_ATTR
  attr_reader :page

  selectable_fields [:language, :theme, :resource_type, :country]

  def initialize(attrs={}, page=1)
    attrs = attrs || {}
    SEARCH_ATTR.each do |attr|
      if val = (attrs[attr] || attrs[attr.to_s])
        instance_variable_set("@#{attr.to_s}", val)
      end
    end
    @page = page
  end

  def find
    @results = Resource.search(
      "title_or_description_contains" => text,
      "language_eq" => language,
      "resource_type_eq" => tool,
      "theme_eq" => topic,
      "country_eq" => country
    ).page(page).per(15)
  end

  def results
    @results
  end

  def persisted?
    false
  end
end

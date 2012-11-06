require 'selectable_fields'

class ResourceSearch
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  include URMP::SelectableFields

  SEARCH_ATTR = [:text, :topics, :technical_expertise, :redd_activities, :resource_types, :countries, :languages]
  RESULTS_PER_PAGE = 10

  attr_accessor *SEARCH_ATTR
  attr_reader :page, :results_per_page

  selectable_fields [:languages, :topics, :resource_types, :country, :activity, :technical_expertise]

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
      "technical_expertise_eq" => technical_expertise,
      "resource_types_id_eq" => resource_types,
      "languages_id_eq" => languages,
      "topics_id_eq" => topics
    ).page(page).per(results_per_page)
  end

  def results
    @results
  end

  def persisted?
    false
  end
end

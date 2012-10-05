class ResourceSearch
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  SEARCH_ATTR = [:text, :topic, :activity, :tool, :technical_expertise, :country, :language]
  attr_reader :page

  attr_accessor *SEARCH_ATTR

  def initialize(attrs={}, page=1)
    SEARCH_ATTR.each do |attr|
      if val = (attrs[attr] || attrs[attr.to_s])
        instance_variable_set("@#{attr.to_s}", val)
      end
    end
    @page = page
  end

  def self.languages
    prepare_for_select(Resource.all.map(&:language))

  end

  def self.topics
    prepare_for_select Resource.all.map(&:theme).uniq
  end

  def self.tools
    prepare_for_select Resource.all.map(&:resource_type).uniq
  end

  def find
    @results = Resource.search(
      "title_or_description_contains" => text,
      "language_eq" => language,
      "resource_type_eq" => tool,
      "theme_eq" => topic
    ).page(page).per(15)
  end

  def results
    @results || []
  end

  def persisted?
    false
  end

  def self.prepare_for_select(elements)
    elements.uniq.reject { |e| e.blank? }
  end
end

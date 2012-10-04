class ResourceSearch
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  SEARCH_ATTR = [:text, :topic, :activity, :tool, :technical_expertise, :country, :language]

  attr_accessor *SEARCH_ATTR

  def initialize(attrs={})
    SEARCH_ATTR.each do |attr|
      if val = (attrs[attr] || attrs[attr.to_s])
        instance_variable_set("@#{attr.to_s}", val)
      end
    end
  end

  def self.languages
    Resource.all.map(&:language).uniq
  end

  def self.topics
    Resource.all.map(&:resource_type).uniq
  end

  def search_text
    "%#{text}%"
  end

  def find
    @results = Resource.where("title like ? OR description like ?", search_text, search_text)
  end

  def results
    @results || []
  end

  def persisted?
    false
  end
end

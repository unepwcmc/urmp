class ResourceSearch
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :text, :topic, :activity, :tool, :technical_expertise, :country, :language

  def self.languages
    Resource.all.map(&:language).uniq
  end

  def self.topics
    Resource.all.map(&:resource_type).uniq
  end

  def find
    @results = Resource.where("")
  end

  def results
    @results || []
  end

  def persisted?
    false
  end
end

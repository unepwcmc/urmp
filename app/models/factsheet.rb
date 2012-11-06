class Factsheet < ActiveRecord::Base
  has_attached_file :attachment
  belongs_to :resource

  validates_attachment :attachment, :presence => true,
    :content_type => { :content_type => "application/pdf" }

  validates :name, :presence => true
  validates :resource, :presence => true

  def self.grouped_by_resource_topic
    factsheets = includes(:resource)
    groups = factsheets.group_by do |factsheet|
      group = factsheet.resource.topics.map(&:name)
      group.empty? ? [nil] : group
    end
    # Keys are currently arrays, expand them
    groups.inject({}) do |expanded_groups, (group_array, factsheets)|
      group_array.each do |topic|
        expanded_groups[topic] ||= []
        expanded_groups[topic].push factsheets
        expanded_groups[topic] = expanded_groups[topic].flatten
      end
      expanded_groups
    end
  end
end

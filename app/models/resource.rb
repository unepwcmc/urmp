class Resource < ActiveRecord::Base
  has_many :resource_links
  has_many :criteria, :through => :resource_links

  rails_admin do
    list do
      field :title
      field :author
      field :language
      field :resource_date
      field :institution
      field :description
      field :link
    end
    edit do
      field :title
      field :author
      field :language
      field :resource_date
      field :institution
      field :description
      field :link
    end
  end
end

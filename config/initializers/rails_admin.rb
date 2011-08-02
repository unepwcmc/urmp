RailsAdmin.config do |config|
  config.model ResourceLink do
    object_label_method do
      :cached_name
    end
    list do
      field :criterion
      field :resource
      field :reference
    end
    edit do
      field :criterion
      field :resource
      field :reference
    end
  end
  config.model Resource do
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

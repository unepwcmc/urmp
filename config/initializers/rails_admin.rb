RailsAdmin.config do |config|
  config.model ResourceLink do
    object_label_method do
      :cached_name
    end
    list do
      field :criterion
      field :resource
      field :reference
      field :numeric_reference
    end
    edit do
      field :criterion
      field :resource
      field :reference
      field :numeric_reference
    end
  end
  config.model Resource do
    list do
      field :title
      field :author
      field :language
      field :resource_type
      field :resource_date
      field :institution
      field :description
      field :link
      field :made_by_un_redd
    end
    edit do
      field :title
      field :author
      field :language
      field :resource_type
      field :resource_date
      field :institution
      field :description
      field :link
      field :made_by_un_redd
    end
  end
  config.model ResourceType do
    visible :false
    edit do
      field :name
    end
  end
end

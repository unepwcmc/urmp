RailsAdmin.config do |config|

  config.main_app_name = ['Urmp', 'Admin']
  config.current_user_method { current_user } #auto-generated
  config.audit_with :history, 'User'

  config.model 'ResourceLink' do
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

  config.model 'Principle' do
    object_label_method do
      :name
    end
    weight -1
    list do
      field :name
      field :description
    end
    edit do
      field :name
      field :number
      field :description, :text do
        bootstrap_wysihtml5 true
      end
    end
  end

  config.model 'Criterion' do
    object_label_method do
      :name
    end
    list do
      field :name
      field :description
      field :principle
    end
    edit do
      field :name
      field :description, :text do
        bootstrap_wysihtml5 true
      end
      field :principle
    end
  end

  config.model 'Resource' do
    list do
      field :title
      field :author
      field :picture
      field :languages
      field :resource_types
      field :resource_date
      field :institution
      field :description
      field :relevance
      field :topics
      field :scales
      field :countries
      field :redd_activities
      field :link
      field :made_by_un_redd
      field :technical_expertise
      field :audience
    end
    edit do
      field :title do
        help 'Required'
      end
      field :author
      field :picture
      field :languages
      field :resource_types
      field :resource_date
      field :institution
      field :description, :text do
        bootstrap_wysihtml5 true
      end
      field :relevance, :text do
        bootstrap_wysihtml5 true
      end
      field :topics
      field :factsheet
      field :scales
      field :countries
      field :redd_activities
      field :link
      field :made_by_un_redd
      field :technical_expertise
      field :audience
    end
  end

  config.model 'Factsheet' do
    edit do
      field :name
      field :attachment do
        help 'Required'
      end
      field :resource
      field :description
    end
  end
end

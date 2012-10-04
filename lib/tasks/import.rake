namespace :urmp do

  desc 'Restore all resources'
  task :restore_all => [:create_principles, :import_criteria, :import_resources, :import_resource_link] do
  end

  desc 'Create principles'
  task :create_principles => :environment do
    Principle.create(:name => 'All Principles', :description => '-')
    Principle.create(:name => 'Principle 1', :description => 'Apply norms of democratic governance, including those reflected in national commitments and Multilateral Agreements')
    Principle.create(:name => 'Principle 2', :description => 'Respect and protect stakeholder rights, including human rights, statutory and customary rights, and collective rights')
    Principle.create(:name => 'Principle 3', :description => "Promote and enhance forests' contribution to sustainable livelihoods")
    Principle.create(:name => 'Principle 4', :description => 'Contribute to low-carbon, climate-resilient sustainable development policy, consistent with national development strategies, national forest programmes and commitments under international conventions and agreements')
    Principle.create(:name => 'Principle 5', :description => 'Principle 5Protect natural forest from degradation and/or conversion to other land uses, including plantation forest')
    Principle.create(:name => 'Principle 6', :description => 'Maintain and enhance multiple functions of forest to deliver benefits including biodiversity conservation and ecosystem services')
    Principle.create(:name => 'Principle 7', :description => 'Minimize adverse impacts (direct and indirect) on non-forest ecosystem services and biodiversity')
  end

  desc 'Import criteria'
  task :import_criteria => :environment do
    csv_file_path = "#{Rails.root}/tmp/criteria.csv"

    criterion = Criterion.create({ :name => 'All', :number => 0, :description => 'All', :principle =>
                                 Principle.find_by_name('All Principles') })

    CSV.foreach csv_file_path do |row|
      number = row[0]
      principle = Principle.find_by_name("Principle #{row[1]}")

      criterion = Criterion.new({
        :number => row[0],
        :name => "Criterion #{number}",
        :principle => principle,
        :description => row[2]
      })

      criterion.save!
    end
  end

  desc 'Import resources from CSV'
  task :import_resources => :environment do
    csv_file_path = "#{Rails.root}/tmp/resources.csv"
    CSV.foreach csv_file_path do |row|

      resource = Resource.new({
        :title => row[0],
        :link => row[1],
        :author => row[2],
        :language => row[3],
        :resource_date => row[4],
        :institution => row[5],
        :description => row[6],
        :made_by_un_redd => row[7] == 'true',
      })

      resource.resource_type = row[8].present? ? row[8].downcase : nil

      resource.save!
    end
  end

  desc 'Import ResourceLink'
  task :import_resource_link => :environment do
    csv_file_path = "#{Rails.root}/tmp/resource_link.json"

    parsed_data = JSON.parse File.read(csv_file_path)

    parsed_data.each do |row|
      resource = Resource.find_by_title(row['resource_link']['resource']['title'])
      unless resource
        p "Can't find resource by title, please assign it manually"
        p row['resource_link']['resource']['title']
        next
      end

      criterion = Criterion.find_by_number(row['resource_link']['criterion']['number'])
      resource_link = ResourceLink.new({
        :resource => resource,
        :criterion => criterion,
        :reference => row['resource_link']['reference'],
        :cached_name => row['resource_link']['cached_name'],
        :numeric_reference => row['resource_link']['numeric_reference']
      })

      resource_link.save!
    end
  end
end

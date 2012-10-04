namespace :urmp do
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


end

namespace :urmp do
  desc "Split reference on colon and put the first element into numeric reference"
  task :split_ref => :environment do
    ResourceLink.all.each do |resource_link|
      split = resource_link.reference.split(':')
      if split.size > 1
        puts "splitting #{resource_link.reference} (#{resource_link.id})"
        resource_link.numeric_reference = split[0]
        resource_link.reference = split[1..split.length-1].join(':')
        resource_link.save
      end
    end
  end
end

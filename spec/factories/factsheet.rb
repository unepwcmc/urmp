FactoryGirl.define do
  factory :factsheet do
    name 'Foo Bar'
    association :resource
    attachment Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/files/orange.pdf", "application/pdf")
  end
end

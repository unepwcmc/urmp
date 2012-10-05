FactoryGirl.define do
  factory :factsheet do
    sequence(:name) { |n| "Foo Bar #{i}" }
    association :resource
    attachment Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/files/orange.pdf", "application/pdf")
  end
end

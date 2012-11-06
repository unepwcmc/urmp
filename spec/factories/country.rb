FactoryGirl.define do
  factory :country do
    sequence(:name) { |n| "country #{n if n > 1}"}
  end
end

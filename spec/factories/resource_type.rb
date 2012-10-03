FactoryGirl.define do
  factory :resource_type do
    sequence(:name) { |n| "Type #{n if n > 1}"}
  end
end

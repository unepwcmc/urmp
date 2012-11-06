FactoryGirl.define do
  factory :resource_type do
    sequence(:name) { |n| "Resource #{n if n > 1}"}
  end
end

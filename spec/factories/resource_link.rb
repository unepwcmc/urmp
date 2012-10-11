FactoryGirl.define do
  factory :resource_link do
    association :resource
    association :criterion
  end
end

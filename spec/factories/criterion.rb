FactoryGirl.define do
  factory :criterion do
    sequence(:number) { |n| n}
    association :principle
  end
end

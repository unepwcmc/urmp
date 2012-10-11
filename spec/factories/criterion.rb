FactoryGirl.define do
  factory :criterion do
    name "criterion"
    description 'foo'
    sequence(:number) { |n| n}
    association :principle
  end
end

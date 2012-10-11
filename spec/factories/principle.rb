FactoryGirl.define do
  factory :principle do
    sequence(:number) { |n| n}
    name 'foo'
    description 'bar'
  end
end

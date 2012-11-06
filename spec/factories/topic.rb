FactoryGirl.define do
  factory :topic do
    sequence(:name) { |n| "Topic #{n if n > 1}"}
  end
end

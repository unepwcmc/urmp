FactoryGirl.define do
  factory :language do
    sequence(:name) { |n| "Language #{n if n > 1}"}
  end
end

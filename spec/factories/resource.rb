FactoryGirl.define do
  factory :resource do
    sequence(:title) { |n| "Resource #{n if n > 1}"}
    association(:resource_type)
    theme Resource::THEMES.first
  end
end

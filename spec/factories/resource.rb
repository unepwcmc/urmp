FactoryGirl.define do
  factory :resource do
    sequence(:title) { |n| "Resource #{n if n > 1}"}
    theme Resource::THEMES.first
    resource_type Resource::TYPES.keys.first
  end
end

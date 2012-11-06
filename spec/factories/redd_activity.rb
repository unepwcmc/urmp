FactoryGirl.define do
  factory :redd_activity do
    sequence(:name) { |n| "redd_activity #{n if n > 1}"}
  end
end

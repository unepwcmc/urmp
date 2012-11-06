FactoryGirl.define do
  factory :scale do
    sequence(:name) { |n| "scale #{n if n > 1}"}
  end
end

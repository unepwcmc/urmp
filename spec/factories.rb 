FactoryGirl.define do
  factory :resource do
    sequence(:title) { |n| "Resource #{n if n > 1}"}
    association(:resource_type)
  end
end

FactoryGirl.define do
  factory :resource_type do
    sequence(:name) { |n| "Type #{n if n > 1}"}
  end
end

FactoryGirl.define do
  factory :principle do
    sequence(:number) { |n| n}
  end
end

FactoryGirl.define do
  factory :principle_translation do
    association :principle
    locale :en
    description "A description"
  end
end

FactoryGirl.define do
  factory :criterion do
    sequence(:number) { |n| n}
    association :principle
  end
end

FactoryGirl.define do
  factory :criterion_translation do
    association :criterion
    locale :en
    description "A description"
  end
end

FactoryGirl.define do
  factory :resource_link do
    association :resource
  end
end

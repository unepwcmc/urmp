FactoryGirl.define do
  factory :resource do
    sequence(:title) { |n| "Resource #{n if n > 1}"}
    theme Resource::THEMES.first
    language { ['English', 'Spanish'][rand(2)] }
    author 'Doswald, N., Dickson, B.'
    institution 'UNEP-WCMC'
    link 'http://foo.bar'
  end
end

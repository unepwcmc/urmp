FactoryGirl.define do
  factory :resource do
    sequence(:title) { |n| "Resource #{n if n > 1}"}
    author 'Doswald, N., Dickson, B.'
    institution 'UNEP-WCMC'
    link 'http://foo.bar'
  end
end

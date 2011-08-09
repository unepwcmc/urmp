Factory.define :resource do |f|  
  f.sequence(:title) { |n| "Resource #{n if n > 1}"}
  f.association(:resource_type)
end  

Factory.define :resource_type do |f|  
  f.sequence(:name) { |n| "Type #{n if n > 1}"}
end  

Factory.define :principle do |f|  
  f.sequence(:number) { |n| n}
end  

Factory.define :principle_translation do |f|  
  f.association :principle
  f.locale :en
  f.description "A description"
end  

Factory.define :criterion do |f|  
  f.sequence(:number) { |n| n}
  f.association :principle
end  

Factory.define :criterion_translation do |f|  
  f.association :criterion
  f.locale :en
  f.description "A description"
end  

Factory.define :resource_link do |f|  
  f.association :resource
end

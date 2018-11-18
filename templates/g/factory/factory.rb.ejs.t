---
to: spec/factories/<%= h.inflection.underscore(name) %>_factory.rb
---
FactoryBot.define do
  factory :<%= h.inflection.underscore(name) %> do
    name {Faker::Name.unique.name}
  end
end

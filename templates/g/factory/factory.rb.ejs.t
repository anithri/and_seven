---
messages: |
  - hygen {bold factory} new --name [NAME]
to: spec/factories/<%= name %>.rb
---
# frozen_string_literal: true
FactoryBot.define do
  factory :<%= h.inflection.transform.underscore(name) %> do
    sequence(:title) { |n| "#{Faker::Lorem.word}-#{n}"}
  end
end

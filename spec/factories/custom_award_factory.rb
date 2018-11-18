# == Schema Information
#
# Table name: custom_awards
#
#  id          :uuid             not null, primary key
#  category    :integer          default("award")
#  description :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  employee_id :uuid
#
# Indexes
#
#  index_custom_awards_on_employee_id  (employee_id)
#
# Foreign Keys
#
#  fk_rails_...  (employee_id => employees.id)
#

FactoryBot.define do
  factory :custom_award do
    category {%w{award milestone}.sample}
    title {Faker::Company.unique.industry}
    description {Faker::Company.unique.catch_phrase}
    employee
  end
end

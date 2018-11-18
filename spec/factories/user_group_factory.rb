# == Schema Information
#
# Table name: user_groups
#
#  id         :uuid             not null, primary key
#  access     :integer          default("guest")
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_user_groups_on_name  (name) UNIQUE
#

FactoryBot.define do
  factory :user_group do
    name {Faker::Name.unique.name}
    access {'guest'}

    %w{guest user power_user limited_admin admin root}.each do |access_lvl|
      factory (access_lvl + '_access').to_sym, class: UserGroup do
        access {access_lvl}
      end
    end
  end
end

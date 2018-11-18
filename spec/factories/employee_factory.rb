# == Schema Information
#
# Table name: employees
#
#  id              :uuid             not null, primary key
#  display_name    :string
#  email           :string
#  is_gone         :boolean          default(FALSE)
#  mobile          :string
#  phone           :string
#  remember_digest :string
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  gust_id         :integer
#  pc3_id          :integer
#
# Indexes
#
#  index_employees_on_display_name     (display_name) UNIQUE
#  index_employees_on_remember_digest  (remember_digest) UNIQUE
#  index_employees_on_username         (username) UNIQUE
#

FactoryBot.define do
  factory :employee do
    display_name {Faker::Name.unique.name}
    username {Faker::Internet.user_name(display_name)}
    email {"#{username}@cppwind.com"}
    is_gone {rand(8).zero?}
    phone {Faker::PhoneNumber.unique.phone_number}
    mobile {Faker::PhoneNumber.unique.phone_number}
    gust_id {rand(100)}
    pc3_id {rand(100) + 1000}
  end
end

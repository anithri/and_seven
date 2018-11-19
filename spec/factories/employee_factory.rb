# == Schema Information
#
# Table name: employees
#
#  id              :uuid             not null, primary key
#  email           :string
#  is_gone         :boolean          default(FALSE)
#  mobile          :string
#  name            :string
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
#  index_employees_on_email            (email) UNIQUE
#  index_employees_on_name             (name) UNIQUE
#  index_employees_on_remember_digest  (remember_digest) UNIQUE
#  index_employees_on_username         (username) UNIQUE
#

FactoryBot.define do
  factory :employee do
    name {Faker::Name.unique.name}
    username {Faker::Internet.user_name(name)}
    email {"#{username}@cppwind.com"}
    is_gone {rand(8).zero?}
    phone {Faker::PhoneNumber.unique.phone_number}
    mobile {Faker::PhoneNumber.unique.phone_number}
    remember_digest {BCrypt::Password.create(Faker::Internet.password)}
    gust_id {rand(100)}
    pc3_id {rand(100) + 1000}
  end
end

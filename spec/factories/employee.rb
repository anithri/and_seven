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

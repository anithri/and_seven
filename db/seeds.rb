# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
require 'faker'
groups = UserGroup.accesses.keys.map do |access|
  UserGroup.find_or_create_by name: "#{access.titleize} Access",
                              access: access
end

scott = Employee.find_or_create_by username:     'scottp',
                                   name: 'Scott M Parrish',
                                   email:        'scottp@cppwind.com'

kevin = Employee.find_or_create_by username:     'kott',
                                   name: 'Kevin Ott',
                                   email:        'kott@cppwind.com'

scott.user_groups << groups.slice(-2,2)
kevin.user_groups << groups.slice(-2,1)
users = [scott, kevin]

10.times do |i|
  name     = Faker::Name.unique.name
  username = Faker::Internet.user_name(name)

  user = Employee.create name: name,
                         username:     username,
                         email:        "#{username}@cppwind.com",
                         is_gone:      rand(8).zero?,
                         phone:        Faker::PhoneNumber.unique.phone_number,
                         mobile:       Faker::PhoneNumber.unique.phone_number,
                         gust_id:      100 + i,
                         pc3_id:       1000 + i,
                         user_groups:  groups.slice(0,5).sample(1 + rand(2))

  users.push user
end

20.times do |i|
  CustomAward.create category:    [0, 1].sample,
                     title:       Faker::Company.unique.industry,
                     description: Faker::Company.unique.catch_phrase,
                     employee:    users.sample
end

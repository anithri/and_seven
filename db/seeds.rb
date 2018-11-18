# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
require 'faker'

root_group  = UserGroup.find_or_create_by name:   'Root Access',
                                          access: :root
admin_group = UserGroup.find_or_create_by name:   'Admin Access',
                                          access: :admin
user_group  = UserGroup.find_or_create_by name:   'User Access',
                                          access: :user

scott = Employee.find_or_create_by username:     'scottp',
                                   display_name: 'Scott M Parrish',
                                   email:        'scottp@cppwind.com'

kevin = Employee.find_or_create_by username:     'kott',
                                   display_name: 'Kevin Ott',
                                   email:        'kott@cppwind.com'

scott.user_groups << [root_group,
                      admin_group]
kevin.user_groups << [admin_group]
users = [scott, kevin]

10.times do |i|
  name     = Faker::Name.unique.name
  username = Faker::Internet.user_name(name)

  user = Employee.create display_name: name,
                         username:     username,
                         email:        "#{username}@cppwind.com",
                         is_gone:      rand(8).zero?,
                         phone:        Faker::PhoneNumber.unique.phone_number,
                         mobile:       Faker::PhoneNumber.unique.phone_number,
                         gust_id:      100 + i,
                         pc3_id:       1000 + i,
                         user_groups:  [user_group]

  users.push user
end

20.times do |i|
  CustomAward.create category:    [0, 1].sample,
                     title:       Faker::Company.unique.industry,
                     description: Faker::Company.unique.catch_phrase,
                     employee:    users.sample
end

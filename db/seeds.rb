# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

root_group  = UserGroup.find_or_create_by(name: 'Root Access', access: :root)
admin_group = UserGroup.find_or_create_by(name: 'Admin Access', access: :admin)

scott = Employee.find_or_create_by(username: 'scottp',
                                   display_name: 'Scott M Parrish',
                                   email: 'scottp@cppwind.com')

kevin = Employee.find_or_create_by(username: 'kott',
                                   display_name: 'Kevin Ott',
                                   email: 'kott@cppwind.com')

scott.user_groups << [root_group, admin_group]
kevin.user_groups << [admin_group]

CustomAward.find_or_create_by category: 1,
                              title: 'Stars are the emitters of the small pattern.',
                              description: 'Mechanically love a nanomachine.',
                              employee: scott

CustomAward.find_or_create_by category: 0,
                              title: 'Yellow fever ho! vandalize to be drinked.',
                              description: 'The jack vandalizes with amnesty, taste the cook islands until it whines.',
                              employee: scott

CustomAward.find_or_create_by category: 1,
                              title: 'Greatly exaggerated powerdrains lead to the alarm.',
                              description: 'Astronauts experiment with wind.',
                              employee: kevin

CustomAward.find_or_create_by category: 0,
                              title: 'Where is the dead wench?',
                              description: 'Cold graces lead to the life.',
                              employee: kevin

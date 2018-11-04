# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

root_group = UserGroup.find_or_create_by(name: 'Root Access', access: :root)
admin_group = UserGroup.find_or_create_by(name: 'Admin Access', access: :admin)

scott = Employee.find_or_create_by(username: 'scottp', display_name: 'Scott M Parrish')
scott.user_groups << [root_group, admin_group]

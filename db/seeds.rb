# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

badges = Array.new
badges << Badge.create(name: "Receiving", skill_type: "hard_skill")
badges << Badge.create(name: "Soups & Sauces", skill_type: "hard_skill")
badges << Badge.create(name: "Storage", skill_type: "hard_skill")
badges << Badge.create(name: "Tools & Equipment", skill_type: "hard_skill")
badges << Badge.create(name: "Vegetables", skill_type: "hard_skill")
badges << Badge.create(name: "Computer Literacy", skill_type: "soft_skill")
badges << Badge.create(name: "Conflict Resolution", skill_type: "soft_skill")
badges << Badge.create(name: "Personal Finances", skill_type: "soft_skill")
badges << Badge.create(name: "Professionalism", skill_type: "soft_skill")
badges << Badge.create(name: "Resource Navigation", skill_type: "soft_skill")
badges << Badge.create(name: "Teamwork", skill_type: "soft_skill")
badges << Badge.create(name: "Time Management", skill_type: "soft_skill")
badges << Badge.create(name: "Workplace Communication", skill_type: "soft_skill")

test_user = User.create(email: "test@test.com", password: "testtest", password_confirmation: "testtest")
test_user.badges << badges.first
test_user.badges << badges.last

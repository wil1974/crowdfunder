# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

4.times do |i|
  Project.create!(
      user_id: 1,
      name: Faker::Name.name,
      short_description: Faker::Hipster.sentence(5, false, 3),
      description: Faker::Hipster.paragraphs(3, true),
      image_url: Faker::Placeholdit.image,
      goal: Faker::Number.between(100, 999999)
  )
end
